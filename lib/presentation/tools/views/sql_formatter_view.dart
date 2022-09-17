import 'package:devtoys/presentation/tools/controllers/sql_formatter_controller.dart';
import 'package:devtoys/presentation/widgets/tool_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';


class SQLFormatterView extends GetView<SQLFormatterController> {
  const SQLFormatterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        controller.formatter.name,
        style: const TextStyle(fontSize: 24),
      )),
      body: Text("Hello"),
    );
  }
}
