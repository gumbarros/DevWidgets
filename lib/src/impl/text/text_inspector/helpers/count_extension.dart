import 'package:dev_widgets/src/impl/text/text_inspector/helpers/split_extension.dart';
import 'dart:convert';

extension Count on String {
  int countOccurences(String find) {
    int count = 0;
    int matchIndex = 0;
    if (isEmpty || find.isEmpty) {
      return count;
    }
    do {
      matchIndex = indexOf(find, matchIndex);
      if (matchIndex != -1) {
        count++;
        matchIndex += find.length;
      }
    } while (matchIndex != -1);
    return count;
  }

  int countSentences() => RegExp(r'([A-Z][^.!?]*[.!?])')
      .allMatches(this)
      .map((e) => e.group(0))
      .length;

  int countLines() => const LineSplitter().convert(this).length;

  int countWords() => splitWords().length;

  int countBytes() => utf8.encode(this).length;

  int countParagraphs() => RegExp(
          r"[^\r\n]*[^ \r\n]+[^\r\n]*((\r|\n|\r\n)[^\r\n]*[^ \r\n]+[^\r\n]*)*")
      .allMatches(this)
      .map((e) => e.group(0))
      .where((e) => e?.isNotEmpty ?? false)
      .length;
}
