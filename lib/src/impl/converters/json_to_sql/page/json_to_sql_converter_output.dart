import 'package:dev_widgets/src/impl/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_hook.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight/languages/sql.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JsonToSqlConverterOutput extends HookConsumerWidget {
  const JsonToSqlConverterOutput({Key? key}) : super(key: key);

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
