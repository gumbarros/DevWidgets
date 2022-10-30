import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_dialect.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_formatter_providers.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/default_drawer.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:highlight/languages/sql.dart';

class SqlFormatterPage extends ConsumerWidget {
  const SqlFormatterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: "sql_formatter".tr()),
        drawer: const DefaultDrawer(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "configuration".tr(), children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(
                      Icons.code,
                      size: 25,
                    ),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "dialect".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<SqlDialect>(
                        value: ref.watch(sqlDialectProvider),
                        items:
                            getDropdownMenuItems<SqlDialect>(SqlDialect.values),
                        onChanged: (selected) => ref
                            .read(sqlDialectProvider.notifier)
                            .state = selected!),
                  ),
                ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    inputController: ref.watch(inputControllerProvider),
                    outputController: CodeController(
                        language: sql, text: ref.watch(outputTextProvider)),
                  )),
            ],
          ),
        ));
  }
}
