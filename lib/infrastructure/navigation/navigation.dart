import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generation_mode.dart';
import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generator_page.dart';
import 'package:dev_widgets/src/impl/converters/json_class/json_to_class_converter_page.dart';
import 'package:dev_widgets/src/impl/converters/json_yaml/json_yaml_converter_page.dart';
import 'package:dev_widgets/src/impl/encoders/base64_image/base64_image_encoder_page.dart';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_text_encoder_page.dart';
import 'package:dev_widgets/src/impl/encoders/html/html_encoder_page.dart';
import 'package:dev_widgets/src/impl/encoders/url/url_encoder_page.dart';
import 'package:dev_widgets/src/impl/formatters/xml_formatter/xml_formatter_page.dart';
import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_generator_page.dart';
import 'package:dev_widgets/src/impl/generators/uuid/uuid_generator_page.dart';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter_page.dart';
import 'package:dev_widgets/src/impl/home/home_page.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_formatter_page.dart';
import 'package:dev_widgets/src/impl/text/html_preview/html_preview_page.dart';
import 'package:dev_widgets/src/impl/text/markdown_preview/markdown_preview_page.dart';
import 'package:dev_widgets/src/impl/settings/settings_page.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_page.dart';
import 'package:dev_widgets/src/impl/text/text_escape/text_escape_page.dart';
import 'package:get/get.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.sqlFormatter, page: () => const SqlFormatterPage()),
    GetPage(name: Routes.jsonFormatter, page: () => const JsonFormatterPage()),
    GetPage(
      name: Routes.htmlEncoder,
      page: () => const HtmlEncoderPage(),
    ),
    GetPage(name: Routes.textEscape, page: () => const TextEscapePage()),
    GetPage(
        name: Routes.markdownPreview, page: () => const MarkdownPreviewPage()),
    GetPage(
      name: Routes.textDiff,
      page: () => const TextDiffPage(),
    ),
    GetPage(name: Routes.xmlFormatter, page: () => const XmlFormatterPage()),
    GetPage(
      name: Routes.urlEncoder,
      page: () => const UrlEncoderView(),
    ),
    GetPage(name: Routes.settings, page: () => const SettingsPage()),
    GetPage(
        name: Routes.lipsumGenerator, page: () => const LipsumGeneratorPage()),
    GetPage(name: Routes.uuidGenerator, page: () => const UuidGeneratorPage()),
    GetPage(
        name: Routes.base64TextEncoder,
        page: () => const Base64TextEncoderPage()),
    GetPage(
      name: Routes.base64ImageEncoder,
      page: () => const Base64ImageEncoderPage(),
    ),
    GetPage(
        name: Routes.jsonToClass, page: () => const JsonToClassConverterPage()),
    GetPage(
        name: Routes.jsonYamlConverter,
        page: () => const JsonYamlConverterPage()),
    GetPage(
      name: Routes.cpf,
      page: () => const CpfCnpjGeneratorPage(mode: GenerationMode.cpf),
    ),
    GetPage(
      name: Routes.cnpj,
      page: () => const CpfCnpjGeneratorPage(mode: GenerationMode.cnpj),
    ),
    GetPage(
      name: Routes.htmlPreview,
      page: () => const HtmlPreviewPage(),
    ),
  ];
}
