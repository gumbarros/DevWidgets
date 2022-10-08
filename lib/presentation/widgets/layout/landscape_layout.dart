import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/widgets/layout/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandscapeLayout extends StatelessWidget {
  final Widget? child;
  final List<Tool> tools;

  static final Rx<bool> compactMode = false.obs;
  static final Rx<int> selectedIndex = 0.obs;

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
                    width: !compactMode.value ? 400 : 80,
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
                          tools: tools, selectedIndex: selectedIndex.value),
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
