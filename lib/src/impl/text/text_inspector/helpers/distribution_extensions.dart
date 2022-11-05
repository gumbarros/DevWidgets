import 'package:dev_widgets/src/impl/text/text_inspector/helpers/count_extension.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/helpers/split_extension.dart';
import 'package:flutter/material.dart';

typedef DistributionMap = Map<String?,int>;

extension Distribution on String {
  DistributionMap wordDistribution(){
    final words = splitWords();
    final map = <String?,int>{};

    for(final word in words.where((w) => w != null).toSet()){
      map[word] = splitWords().where((w) => w == word).length;
    }

    return map;
  }

  DistributionMap characterDistribution(){
    final map = <String?,int>{};

    for(final char in characters.toSet()){
      map[char] = countOccurences(char);
    }

    return map;
  }
}

extension DistributionMapExtensions on DistributionMap{
  String getString(){
    final buffer = StringBuffer();

    final sortedMap = Map.fromEntries(
        entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));

    for(final entry in sortedMap.entries){
      if(entry.key == " "){
        buffer.write("⎵");
      }
      else if(entry.key == "\n"){
        buffer.write("\\n");
      }
      else{
        buffer.write(entry.key);
      }
      buffer.write(": ${entry.value}\n");
    }

    return buffer.toString();
  }
}
