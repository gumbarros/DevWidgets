import 'package:dev_widgets/src/impl/encoders/base64_text/base64_encoding_type.dart';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_text_encoder_providers.dart';
import 'package:dev_widgets/src/impl/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class Base64TextEncoderPage extends ConsumerWidget {
  const Base64TextEncoderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: "base64_text".tr()),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(
                    headline: StringTranslateExtension("configuration").tr(),
                    children: [
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.compare_arrows_sharp),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("conversion").tr()),
                              subtitle: Text(
                                  StringTranslateExtension("conversion_mode")
                                      .tr())),
                        ),
                        actionWidget: DropdownButton<ConversionMode>(
                            value: ref.watch(conversionModeProvider),
                            items: getDropdownMenuItems<ConversionMode>(
                                ConversionMode.values),
                            onChanged: (selected) {
                              ref.read(conversionModeProvider.notifier).state =
                                  selected!;
                            }),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.grid_3x3),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("encoding").tr()),
                              subtitle: Text(StringTranslateExtension(
                                      "encoding_description")
                                  .tr())),
                        ),
                        actionWidget: DropdownButton<Base64EncodingType>(
                            value: ref.watch(encodingTypeProvider),
                            items: getDropdownMenuItems<Base64EncodingType>(
                                Base64EncodingType.values),
                            onChanged: (selected) {
                              ref.read(encodingTypeProvider.notifier).state =
                                  selected!;
                            }),
                      )
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    inputController: ref.watch(inputControllerProvider),
                    usesCodeControllers: false,
                    outputController: TextEditingController(
                        text: ref.watch(outputTextProvider)),
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
