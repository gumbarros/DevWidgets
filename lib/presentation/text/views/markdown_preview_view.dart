import 'package:devtoys/presentation/text/controllers/markdown_preview_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class MarkdownPreviewView extends GetView<MarkdownPreviewController> {
  const MarkdownPreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.title),
        body: Container(
            height: Get.height - kToolbarHeight,
            child: SingleChildScrollView(
              child: Container(
                height: Get.height / 1.2,
                child: IOEditor(
                    inputController: controller.inputController,
                    outputChild: Column(children: [
                      IOToolbar(title: "preview".tr),
                      Container(
                        width: Get.width / 1.5,
                        margin: EdgeInsets.all(8.0),
                        height: Get.height / 1.5,
                        child: Obx(() =>
                            Markdown(data: controller.output.value ?? "")),
                      )
                    ])),
              ),
            )));
  }
}
