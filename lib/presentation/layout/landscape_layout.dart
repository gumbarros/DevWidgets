import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/layout/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class LandscapeLayout extends StatelessWidget {
  final Widget? child;
  final List<Tool> tools;

  static final Rx<bool> compactMode = false.obs;
  static final Rx<String> selectedToolName = (HomeTool).toString().obs;

  const LandscapeLayout({super.key, required this.child, required this.tools});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => SizedBox(
                    width: !compactMode.value
                        ? context.layout.value(
                            xs: Get.width / 5,
                            sm: Get.width / 5,
                            md: Get.width / 5,
                            lg: Get.width / 6,
                            xl: Get.width / 7)
                        : Get.width / 16,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                      child: Menu(
                          tools: tools,
                          selectedToolName: selectedToolName.value),
                    ),
                  ),
                ),
                Expanded(
                  child: child ?? SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
