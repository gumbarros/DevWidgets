import 'dart:convert';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_fields_mapper.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_options.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_hook.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/input_editor.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight/languages/json.dart';
import 'package:highlight/languages/sql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonToSqlConverterPage extends ConsumerWidget {
  const JsonToSqlConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: YaruTabbedPage(
          tabIcons: const [Icons.data_object, Icons.dataset, Icons.output],
          tabTitles: ["input".tr(), "options".tr(), "output".tr()],
          views: const [_Input(), JsonToSqlConverterOptions(), _Output()],
          onTap: (int index) {
            ref.read(selectedTabProvider.notifier).state = index;
          },
        ));
  }
}

class _Input extends HookConsumerWidget {
  const _Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useCodeController(language: json);

    useEffect(() {
      controller.text = ref.read(jsonInputProvider);

      controller.addListener(() {
        try {
          String text = applyWebSpaceFix(controller.text);

          ref.read(jsonInputProvider.notifier).state = text;

          final mapList = List<Map<String, dynamic>>.from(jsonDecode(text));

          final fields = getTableFields(mapList);
          ref.read(fieldListProvider.notifier).setState(fields);
          ref.read(isValidJsonProvider.notifier).state = true;
        } on Exception catch (_) {
          ref.read(isValidJsonProvider.notifier).state = false;
        }
      });
      return;
    });

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: InputEditor(inputController: controller),
      ),
    );
  }
}

class _Output extends HookConsumerWidget {
  const _Output({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useCodeController(language: sql);

    useEffect(() {
      controller.text = !ref.read(isValidJsonProvider)
          ? "invalid_json_data".tr()
          : ref.read(sqlOutputProvider);
      return null;
    });

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: OutputEditor(
            outputController: controller, usesCodeControllers: true),
      ),
    );
  }
}
