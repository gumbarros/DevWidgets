import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IOToolbar extends StatelessWidget {
  const IOToolbar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 20,
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20)),
          Row(
            children: actions
                    ?.map(
                        (element) => element.marginOnly(left: 8.0, right: 8.0))
                    .toList() ??
                [],
          )
        ],
      ),
    );
  }
}
