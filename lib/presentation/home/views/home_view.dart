import 'package:devtoys/presentation/home/controllers/home_controller.dart';
import 'package:devtoys/presentation/widgets/drawer.dart';
import 'package:devtoys/presentation/widgets/tool_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DevToysDrawer(),
      appBar: AppBar(
          title: Text(
        'all_tools'.tr,
        style: const TextStyle(fontSize: 24),
      )),
      body: SingleChildScrollView(
          child: GridView.builder(
        itemCount: controller.tools.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount:
                context.layout.value(xs: 1, sm: 2, md: 3, lg: 4, xl: 5)),
        itemBuilder: (BuildContext context, int index) {
          return ToolCard(controller.tools[index]);
        },
      )),
    );
  }
}
