import 'package:devtoys/infrastructure/locale/supported_locale.dart';
import 'package:devtoys/infrastructure/locale/translations.en_us.dart';
import 'package:devtoys/infrastructure/locale/translations.pt_br.dart';
import 'package:get/get.dart';

class DevToysTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTranslations.keys,
        'pt_BR': BrazilianPortugueseTranslations.keys
      };

  static List<SupportedLocale> get supportedLocales => [
        SupportedLocale("English", "en_US"),
        SupportedLocale("Brazilian Portuguese", "pt_BR")
      ];
}
