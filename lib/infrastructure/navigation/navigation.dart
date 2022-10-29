import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/base64_text_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/html_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/url_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/formatters/xml_formatter_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/generators/lipsum_generator_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/generators/uuid_generator_controller_binding.dart.dart';
import 'package:dev_widgets/src/brazil/cpf_cnpj/cpf_cnpj_generation_mode.dart';
import 'package:dev_widgets/src/brazil/cpf_cnpj/cpf_cnpj_generator_page.dart';
import 'package:dev_widgets/src/converters/json_class/json_to_class_converter_page.dart';
import 'package:dev_widgets/src/converters/json_yaml/json_yaml_converter_page.dart';
import 'package:dev_widgets/src/encoders/base64_image/base64_image_encoder_page.dart';
import 'package:dev_widgets/presentation/encoders/views/base64_text_encoder_view.dart';
import 'package:dev_widgets/presentation/encoders/views/html_encoder_view.dart';
import 'package:dev_widgets/presentation/encoders/views/url_encoder_view.dart';
import 'package:dev_widgets/presentation/formatters/views/xml_formatter_view.dart';
import 'package:dev_widgets/presentation/generators/views/lipsum_generator_view.dart';
import 'package:dev_widgets/presentation/generators/views/uuid_generator_view.dart';
import 'package:dev_widgets/src/formatters/json_formatter/json_formatter_page.dart';
import 'package:dev_widgets/src/home/home_page.dart';
import 'package:dev_widgets/src/formatters/sql_formatter/sql_formatter_page.dart';
import 'package:dev_widgets/src/text/html_preview/html_preview_page.dart';
import 'package:dev_widgets/src/text/markdown_preview/markdown_preview_page.dart';
import 'package:dev_widgets/src/settings/settings_page.dart';
import 'package:dev_widgets/src/text/text_diff/text_diff_page.dart';
import 'package:dev_widgets/src/text/text_escape/text_escape_page.dart';
import 'package:get/get.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.sqlFormatter, page: () => const SqlFormatterPage()),
    GetPage(name: Routes.jsonFormatter, page: () => const JsonFormatterPage()),
    GetPage(
      name: Routes.htmlEncoder,
      page: () => const HTMLEncoderView(),
      binding: HTMLEncoderControllerBinding(),
    ),
    GetPage(name: Routes.textEscape, page: () => const TextEscapePage()),
    GetPage(
        name: Routes.markdownPreview, page: () => const MarkdownPreviewPage()),
    GetPage(
      name: Routes.textDiff,
      page: () => const TextDiffPage(),
    ),
    GetPage(
      name: Routes.xmlFormatter,
      page: () => const XmlFormatterPage(),
      binding: XMLFormatterControllerBinding(),
    ),
    GetPage(
      name: Routes.urlEncoder,
      page: () => const UrlEncoderView(),
      binding: UrlEncoderControllerBinding(),
    ),
    GetPage(name: Routes.settings, page: () => const SettingsPage()),
    GetPage(
      name: Routes.lipsumGenerator,
      page: () => const LipsumGeneratorView(),
      binding: LipsumGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.uuidGenerator,
      page: () => const UuidGeneratorView(),
      binding: UuidGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.base64TextEncoder,
      page: () => const Base64TextEncoderView(),
      binding: Base64TextEncoderControllerBinding(),
    ),
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
