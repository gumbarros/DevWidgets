import 'package:dev_widgets/src/tools.dart';
import 'package:dev_widgets/src/home/home_tool.dart';

class Routes {
  static const home = '/home';

  static const uuidGenerator = '/generators/uuid';
  static const lipsumGenerator = '/generators/lipsum';
  static const sqlFormatter = '/formatters/sql';
  static const jsonFormatter = '/formatters/json';
  static const xmlFormatter = '/formatters/xml';
  static const htmlEncoder = "/encoders/html";
  static const textEscape = "/text/escape";
  static const htmlPreview = '/text/htmlPreview';
  static const markdownPreview = "/text/markdown";
  static const textDiff = "/text/diff";
  static const urlEncoder = "/encoders/url";
  static const settings = "/settings";
  static const base64TextEncoder = '/encoders/base64text';
  static const base64ImageEncoder = '/encoder/base64image';
  static const jsonToClass = '/converters/jsonToClass';
  static const jsonYamlConverter = '/converters/jsonYaml';
  static const timestampConverter = '/converters/timestamp';
  static const cronParser = '/converters/cronParser';
  static const numberBase = '/converters/numberBase';
  static const cpf = '/brazil/cpf';
  static const cnpj = '/brazil/cnpj';

  static String getToolRouteByCommandLineArgs(List<String> args) {
    if (args.isNotEmpty) {
      return allTools
          .firstWhere((tool) => tool.name == args.first,
              orElse: () => const HomeTool())
          .route;
    }
    return Routes.home;
  }
}
