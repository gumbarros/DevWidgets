import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/global_settings.dart';
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
                  () => AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: isCompactLayout(context) ? 80 : Get.width / 5,
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
                ),
                Expanded(
                  child: child ?? const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
