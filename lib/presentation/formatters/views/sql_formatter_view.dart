import 'package:dev_widgets/src/models/tools/formatters/sql_formatter/sql_dialect.dart';
import 'package:dev_widgets/presentation/formatters/controllers/sql_formatter_controller.dart';
import 'package:dev_widgets/src/helpers.dart';
import 'package:dev_widgets/src/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SQLFormatterView extends GetView<SqlFormatterController> {
  const SQLFormatterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(
                    headline: StringTranslateExtension("configuration").tr(),
                    children: [
                      YaruRow(
                          enabled: true,
                          leadingWidget: const Icon(
                            Icons.code,
                            size: 25,
                          ),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              StringTranslateExtension("dialect").tr(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actionWidget: Obx(
                            () => DropdownButton<SqlDialect>(
                                value: controller.dialect.value,
                                items: getDropdownMenuItems<SqlDialect>(
                                    SqlDialect.values),
                                onChanged: (selected) => controller.dialect
                                    .value = selected ?? SqlDialect.generic),
                          )),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
