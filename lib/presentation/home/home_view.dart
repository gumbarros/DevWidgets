import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/presentation/home/home_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/tool_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: HomeTool().homeTitle),
      body: SingleChildScrollView(
          child: GridView.builder(
        itemCount: controller.tools.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            childAspectRatio: .7,
            crossAxisCount:
                context.layout.value(xs: 1, sm: 2, md: 3, lg: 5, xl: 7)),
        itemBuilder: (BuildContext context, int index) {
          return ToolCard(controller.tools[index]);
        },
      )),
    );
  }
}
