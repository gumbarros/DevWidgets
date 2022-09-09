import 'package:devtoys/presentation/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tools = controller.getAllTools();
    
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'all_tools'.tr,
        style: const TextStyle(fontSize: 24),
      )),
      body: SingleChildScrollView(
          child: GridView.builder(
        itemCount: tools.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3/2,
          crossAxisCount: context.layout.value(xs: 1, sm: 2, md: 3, lg: 4, xl: 5)
        ),
        itemBuilder: (BuildContext context, int index) {
          return MenuCard(
              icon: tools[index].icon, text: tools[index].name, onTap: () {});
        },
      )),
    );
  }
}
