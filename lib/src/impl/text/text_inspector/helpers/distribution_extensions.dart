import 'package:dev_widgets/src/impl/text/text_inspector/helpers/split_extension.dart';

typedef DistributionMap = Map<String?,int>;

extension Distribution on String {
  DistributionMap wordDistribuition(){
    final words = splitWords();
    final map = <String?,int>{};

    for(final word in words.where((w) => w != null).toSet()){
      map[word] = splitWords().where((w) => w == word).length;
    }

    return map;
  }
}

extension DistributionMapExtensions on DistributionMap{
  String getString(){
    final buffer = StringBuffer();

    for(final entry in entries){
      buffer.write("${entry.key}:${entry.value}\n");
    }

    return buffer.toString();
  }
}
