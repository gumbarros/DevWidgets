import 'package:dev_widgets/src/impl/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_input.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_options.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_output.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
          views: const [
            JsonToSqlConverterInput(),
            JsonToSqlConverterOptions(),
            JsonToSqlConverterOutput()
          ],
          onTap: (int index) {
            ref.read(selectedTabProvider.notifier).state = index;
          },
        ));
  }
}
