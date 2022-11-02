import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCase = StateProvider<String>((ref) => "");

class TextInspectorPage extends ConsumerWidget {
  const TextInspectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: IOEditor(
                    inputController: TextEditingController(),
                    outputChild: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: const EdgeInsets.all(8.0),
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Text("pan"),
                    )),
              ),
            ));
  }
}
