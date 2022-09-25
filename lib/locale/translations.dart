import 'package:devtoys/locale/translations.en_us.dart';
import 'package:devtoys/locale/translations.pt_br.dart';
import 'package:get/get.dart';

class DevToysTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTranslations.keys,
        'pt_BR': BrazilianPortugueseTranslations.keys
      };
}
