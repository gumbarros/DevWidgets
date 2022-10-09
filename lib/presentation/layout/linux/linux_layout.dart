import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/global_variables.dart';
import 'package:devtoys/presentation/layout/linux/linux_menu.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class LinuxLayout extends StatelessWidget {
  final Widget? child;
  final List<Tool> tools;

  const LinuxLayout({super.key, required this.child, required this.tools});

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
                    width: !context.layout.breakpoint.isSmall() &&
                            !GlobalVariables.compactMode.value
                        ? context.layout.value(
                            xs: Get.width / 5,
                            sm: Get.width / 5,
                            md: Get.width / 5,
                            lg: Get.width / 6,
                            xl: Get.width / 7)
                        : 80,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                      child: LinuxMenu(
                          tools: tools,
                          selectedToolName:
                              GlobalVariables.selectedToolName.value),
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
