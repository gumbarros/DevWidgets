import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_generator.dart';
import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lipsumTypeProvider = StateProvider<LipsumType>((ref) => LipsumType.words);
final startWithLoremProvider = StateProvider<bool>((ref) => true);
final amountProvider = StateProvider<int>((ref) => 10);
final outputTextProvider = StateProvider<String>((ref) => generateLipsum(
      type: ref.watch(lipsumTypeProvider),
      count: ref.watch(amountProvider),
      startWithLorem: ref.watch(startWithLoremProvider),
    ));
