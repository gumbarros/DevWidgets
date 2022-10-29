import 'package:dev_widgets/src/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/home/home_card.dart';
import 'package:dev_widgets/src/tools.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: "all_tools".tr()),
        body: ResponsiveGridView.builder(
          itemCount: allTools.length,
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          gridDelegate: const ResponsiveGridDelegate(
              crossAxisSpacing: 100,
              mainAxisSpacing: 50,
              childAspectRatio: 3 / 1.5,
              maxCrossAxisExtent: 300,
              minCrossAxisExtent: 300),
          itemBuilder: (BuildContext context, int index) =>
              HomeCard(allTools[index]),
        ));
  }
}
