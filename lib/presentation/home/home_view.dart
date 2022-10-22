import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/presentation/home/home_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/tool_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_grid.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: HomeTool().homeTitle),
        body: ResponsiveGridView.builder(
          itemCount: controller.tools.length,
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          gridDelegate: const ResponsiveGridDelegate(
              crossAxisSpacing: 100,
              mainAxisSpacing: 50,
              childAspectRatio: 3 / 1.5,
              maxCrossAxisExtent: 300,
              minCrossAxisExtent: 300),
          itemBuilder: (BuildContext context, int index) =>
              ToolCard(controller.tools[index]),
        ));
  }
}
