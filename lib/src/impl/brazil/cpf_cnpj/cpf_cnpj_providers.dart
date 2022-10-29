import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generation_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brazil/brazil.dart';

final isFormattedProvider = StateProvider<bool>((ref) => false);
final amountProvider = StateProvider<int>((ref) => 1);

class CpfCnpjGenerator extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void generate(GenerationMode mode) {
    String output = "";

    bool isFormatted = ref.read(isFormattedProvider);
    int amount = ref.read(amountProvider);

    for (int i = 0; i < amount; i++) {
      String result = mode == GenerationMode.cpf
          ? generateCpf(isFormatted: isFormatted)
          : generateCnpj(isFormatted: isFormatted);
      output += "$result\n";
    }

    state = output;
  }
}

final cpfCnpjGeneratorProvider =
    NotifierProvider<CpfCnpjGenerator, String>(CpfCnpjGenerator.new);
