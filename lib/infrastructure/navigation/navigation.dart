import 'package:devtoys/infrastructure/bindings/controllers/converters/json_to_class_converter_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/converters/json_yaml_converter_controller.dart';
import 'package:devtoys/infrastructure/bindings/controllers/encoders/base64_image_encoder_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/encoders/base64_text_encoder_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/encoders/html_encoder_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/encoders/url_encoder_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/formatters/xml_formatter_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/generators/lipsum_generator_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/generators/uuid_generator_controller_binding.dart.dart';
import 'package:devtoys/infrastructure/bindings/controllers/home_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/formatters/json_formatter_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/formatters/sql_formatter_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/settings_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/text/markdown_preview_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/text/text_diff_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/text/text_escape_controller_binding.dart';
import 'package:devtoys/presentation/converters/views/json_to_class_converter_view.dart';
import 'package:devtoys/presentation/converters/views/json_yaml_converter_view.dart';
import 'package:devtoys/presentation/encoders/views/base64_image_encoder_view.dart';
import 'package:devtoys/presentation/encoders/views/base64_text_encoder_view.dart';
import 'package:devtoys/presentation/encoders/views/html_encoder_view.dart';
import 'package:devtoys/presentation/encoders/views/url_encoder_view.dart';
import 'package:devtoys/presentation/formatters/views/xml_formatter_view.dart';
import 'package:devtoys/presentation/generators/views/lipsum_generator_view.dart';
import 'package:devtoys/presentation/generators/views/uuid_generator_view.dart';
import 'package:devtoys/presentation/home/home_view.dart';
import 'package:devtoys/presentation/formatters/views/json_formatter_view.dart';
import 'package:devtoys/presentation/formatters/views/sql_formatter_view.dart';
import 'package:devtoys/presentation/settings/settings_view.dart';
import 'package:devtoys/presentation/text/views/markdown_preview_view.dart';
import 'package:devtoys/presentation/text/views/text_diff_view.dart';
import 'package:devtoys/presentation/text/views/text_escape_view.dart';
import 'package:get/get.dart';
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
      name: Routes.markdownPreview,
      page: () => const MarkdownPreviewView(),
      binding: MarkdownPreviewControllerBinding(),
    ),
    GetPage(
      name: Routes.textDiff,
      page: () => const TextDiffView(),
      binding: TextDiffControllerBinding(),
    ),
    GetPage(
      name: Routes.xmlFormatter,
      page: () => const XMLFormatterView(),
      binding: XMLFormatterControllerBinding(),
    ),
    GetPage(
      name: Routes.urlEncoder,
      page: () => const URLEncoderView(),
      binding: URLEncoderControllerBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsControllerBinding(),
    ),
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
  ];
}
