import 'package:dev_widgets/src/impl/home/home_card.dart';
import 'package:dev_widgets/src/impl/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_grid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tools = allTools.where((t) => t.group.name != "home").toList();

    return ResponsiveGridView.builder(
          itemCount: tools.length,
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          gridDelegate: const ResponsiveGridDelegate(
              crossAxisSpacing: 100,
              mainAxisSpacing: 50,
              childAspectRatio: 3 / 1.5,
              maxCrossAxisExtent: 300,
              minCrossAxisExtent: 300),
          itemBuilder: (BuildContext context, int index) =>
              HomeCard(tools[index]),
        );
  }
}
