import 'package:dev_widgets/infrastructure/bindings/controllers/brazil/cnpj_generator_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/brazil/cpf_generator_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/converters/json_to_class_converter_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/converters/json_yaml_converter_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/base64_image_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/base64_text_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/html_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/encoders/url_encoder_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/formatters/xml_formatter_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/generators/lipsum_generator_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/generators/uuid_generator_controller_binding.dart.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/home_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/formatters/json_formatter_controller_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/formatters/sql_formatter_controller_binding.dart';

import 'package:dev_widgets/infrastructure/bindings/controllers/text/text_escape_controller_binding.dart';
import 'package:dev_widgets/presentation/brazil/views/cpf/cnpj_generator_view.dart';
import 'package:dev_widgets/presentation/brazil/views/cpf/cpf_generator_view.dart';
import 'package:dev_widgets/presentation/converters/views/json_to_class_converter_view.dart';
import 'package:dev_widgets/presentation/converters/views/json_yaml_converter_view.dart';
import 'package:dev_widgets/presentation/encoders/views/base64_image_encoder_view.dart';
import 'package:dev_widgets/presentation/encoders/views/base64_text_encoder_view.dart';
import 'package:dev_widgets/presentation/encoders/views/html_encoder_view.dart';
import 'package:dev_widgets/presentation/encoders/views/url_encoder_view.dart';
import 'package:dev_widgets/presentation/formatters/views/xml_formatter_view.dart';
import 'package:dev_widgets/presentation/generators/views/lipsum_generator_view.dart';
import 'package:dev_widgets/presentation/generators/views/uuid_generator_view.dart';
import 'package:dev_widgets/presentation/home/home_view.dart';
import 'package:dev_widgets/presentation/formatters/views/json_formatter_view.dart';
import 'package:dev_widgets/presentation/formatters/views/sql_formatter_view.dart';

import 'package:dev_widgets/src/impl/text/html_preview/html_preview_page.dart';
import 'package:dev_widgets/src/impl/text/markdown_preview/markdown_preview_page.dart';
import 'package:dev_widgets/presentation/text/views/text_escape_view.dart';
import 'package:dev_widgets/src/impl/settings/settings_page.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_page.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.sqlFormatter,
      page: () => const SQLFormatterView(),
      binding: SQLFormatterControllerBinding(),
    ),
    GetPage(
      name: Routes.jsonFormatter,
      page: () => const JsonFormatterView(),
      binding: JsonFormatterControllerBinding(),
    ),
    GetPage(
      name: Routes.htmlEncoder,
      page: () => const HTMLEncoderView(),
      binding: HTMLEncoderControllerBinding(),
    ),
    GetPage(
      name: Routes.textEscape,
      page: () => const TextEscapeView(),
      binding: TextEscapeControllerBinding(),
    ),
    GetPage(
        name: Routes.markdownPreview, page: () => const MarkdownPreviewPage()),
    GetPage(
      name: Routes.textDiff,
      page: () => const TextDiffPage(),
    ),
    GetPage(
      name: Routes.xmlFormatter,
      page: () => const XMLFormatterView(),
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
      page: () => const Base64ImageEncoderView(),
      binding: Base64ImageEncoderControllerBinding(),
    ),
    GetPage(
      name: Routes.jsonToClass,
      page: () => const JsonToClassConverterView(),
      binding: JsonToClassConverterControllerBinding(),
    ),
    GetPage(
      name: Routes.jsonYamlConverter,
      page: () => const JsonYamlConverterView(),
      binding: JsonYamlConverterControllerBinding(),
    ),
    GetPage(
      name: Routes.cpf,
      page: () => const CpfGeneratorView(),
      binding: CpfGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.cnpj,
      page: () => const CnpjGeneratorView(),
      binding: CnpjGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.htmlPreview,
      page: () => const HtmlPreviewPage(),
    ),
  ];
}
