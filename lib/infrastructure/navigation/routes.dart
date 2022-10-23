import 'package:dev_widgets/domain/models/tools/home_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/domains/tools_binding.dart';

class Routes {
  static const home = '/home';

  static const uuidGenerator = '/generators/uuid';
  static const lipsumGenerator = '/generators/lipsum';
  static const sqlFormatter = '/formatters/sql';
  static const jsonFormatter = '/formatters/json';
  static const xmlFormatter = '/formatters/xml';
  static const htmlEncoder = "/encoders/html";
  static const textEscape = "/text/escape";
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

  static String getToolRouteByCommandLineArgs(List<String> args) {
    if (args.isNotEmpty) {
      var tools = ToolsBinding.getAllTools();
      return tools
          .firstWhere((tool) => tool.name == args.first,
              orElse: () => HomeTool())
          .route;
    }
    return Routes.home;
  }
}
