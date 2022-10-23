import 'package:dev_widgets/infrastructure/locale/supported_locale.dart';
import 'package:dev_widgets/infrastructure/locale/translations.de_de.dart';
import 'package:dev_widgets/infrastructure/locale/translations.en_us.dart';
import 'package:dev_widgets/infrastructure/locale/translations.pt_br.dart';
import 'package:get/get.dart';

class DevWidgetsTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTranslations.keys,
        'pt_BR': BrazilianPortugueseTranslations.keys,
        'de_DE': GermanTranslations.keys,
      };

  static List<SupportedLocale> get supportedLocales => [
        SupportedLocale("English", "en_US"),
        SupportedLocale("Brazilian Portuguese", "pt_BR"),
        SupportedLocale("German", "de_DE"),
      ];
}
