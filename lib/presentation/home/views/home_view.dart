import 'package:devtoys/presentation/home/controllers/home_controller.dart';
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
      appBar: DefaultAppBar(title: "all_tools".tr),
      body: SingleChildScrollView(
          child: GridView.builder(
        itemCount: controller.tools.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3,
            crossAxisCount:
                context.layout.value(xs: 1, sm: 2, md: 3, lg: 5, xl: 7)),
        itemBuilder: (BuildContext context, int index) {
          return ToolCard(controller.tools[index]);
        },
      )),
    );
  }
}
