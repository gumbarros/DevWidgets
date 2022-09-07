import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all_tools'.tr)
      ),
      body: SingleChildScrollView(child: Column(children: controller.getAllTools().map((e) => Text(e.name)).toList())),
    );
  }
}
