import 'package:dev_widgets/src/impl/domain/generators/generator.dart';
import 'package:dev_widgets/src/models/tools/generators/lipsum/lipsum_type.dart';
import 'package:ipsum/ipsum.dart';

import 'package:easy_localization/easy_localization.dart';

class LipsumGenerator implements Generator {
  @override
  String generate({
    LipsumType type = LipsumType.words,
    bool startWithLorem = false,
    int count = 5,
  }) {
    Ipsum i = Ipsum(startWithLorem: startWithLorem);

    try {
      switch (type) {
        case LipsumType.words:
          return i.words(count);
        case LipsumType.sentences:
          return i.sentences(count);
        case LipsumType.paragraphs:
          return i.paragraphs(count);
        default:
          return "";
      }
    } on Exception catch (_) {
      return "error".tr();
    }
  }
}
