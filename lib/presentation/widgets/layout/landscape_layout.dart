import 'package:devtoys/presentation/widgets/layout/landscape_menu.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';

class LandscapeLayout extends StatelessWidget {
  final Widget? child;
  final MenuItemBuilder iconBuilder;
  final MenuItemBuilder titleBuilder;

  const LandscapeLayout(
      {super.key,
      required this.child,
      required this.iconBuilder,
      required this.titleBuilder});

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
                SizedBox(
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: YaruPageItemListView(
                      length: 1,
                      selectedIndex: 1,
                      onTap: (_) {},
                      iconBuilder: iconBuilder,
                      titleBuilder: titleBuilder,
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
