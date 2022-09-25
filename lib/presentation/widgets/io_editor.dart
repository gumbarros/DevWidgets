import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resizable_widget/resizable_widget.dart';

class IOEditor extends StatelessWidget {
  final CodeController inputController;
  final CodeController outputController;

  const IOEditor(
      {super.key,
      required this.inputController,
      required this.outputController});

  @override
  Widget build(BuildContext context) {
    return ResizableWidget(
      isDisabledSmartHide: true,
      children: [
        Column(
          children: [
            getCodeToolbar(title: "input".tr, actions: [
              ElevatedButton.icon(
                icon: Icon(FontAwesomeIcons.paste),
                label: Text("paste".tr),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: Icon(FontAwesomeIcons.copy),
                label: Text("copy".tr),
                onPressed: () async {
                  await Clipboard.setData(
                      ClipboardData(text: inputController.text));
                },
              ),
              ElevatedButton.icon(
                icon: Icon(FontAwesomeIcons.xmark),
                label: Text("clear".tr),
                onPressed: () => inputController.clear(),
              ),
            ]),
            Container(
                width: Get.width,
                margin: EdgeInsets.all(8.0),
                height: Get.height / 1.5,
                child: CodeField(
                  wrap: true,
                  expands: true,
                  controller: inputController,
                )),
          ],
        ),
        Container(
          child: Column(
            children: [
              getCodeToolbar(title: "output".tr, actions: [
                ElevatedButton.icon(
                  icon: Icon(FontAwesomeIcons.copy),
                  label: Text("copy".tr),
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: outputController.text));
                  },
                ),
              ]),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.all(8.0),
                  height: Get.height / 1.5,
                  child: CodeField(
                    expands: true,
                    controller: outputController,
                    enabled: true,
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget getCodeToolbar(
      {required String title, required List<Widget> actions}) {
    return Container(
      height: Get.height / 20,
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20)),
          Row(
            children: actions
                .map((element) => element.marginOnly(left: 8.0, right: 8.0))
                .toList(),
          )
        ],
      ),
    );
  }
}
