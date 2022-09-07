import 'package:devtoys/locale/translations.enUS.dart';
import 'package:devtoys/locale/translations.ptBR.dart';
import 'package:get/get.dart';

class DevToysTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTranslations.keys,
        'pt_BR': BrazilianPortugueseTranslations.keys
      };
}