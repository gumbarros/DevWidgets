import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/layout/linux/linux_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    width: isCompactLayout(context)
                        ? Get.width / 12
                        : Get.width / 6,
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
                              GlobalSettings.selectedToolName.value),
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
