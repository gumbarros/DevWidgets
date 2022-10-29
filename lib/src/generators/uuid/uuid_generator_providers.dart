import 'package:dev_widgets/src/generators/uuid/uuid_generator.dart';
import 'package:dev_widgets/src/generators/uuid/uuid_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uuidTypeProvider = StateProvider<UuidType>((ref) => UuidType.v4);
final hiphensProvider = StateProvider<bool>((ref) => true);
final uppercaseProvider = StateProvider<bool>((ref) => true);
final amountProvider = StateProvider<int>((ref) => 1);
final outputTextProvider = StateProvider<String>((ref) => "");

class UuidGenerator extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void generate() {
    String output = "";

    final uuidType = ref.read(uuidTypeProvider);
    final hyphens = ref.read(hiphensProvider);
    final uppercase = ref.read(uppercaseProvider);
    final amount = ref.read(amountProvider);

    for (int i = 0; i < amount; i++) {
      String uuid = generateUuid(
        type: uuidType,
        uppercase: uppercase,
        hyphens: hyphens,
      );
      output += "$uuid\n";
    }

    state = output;
  }

  clear() {
    state = "";
  }
}

final uuidGeneratorProvider =
    NotifierProvider<UuidGenerator, String>(UuidGenerator.new);
