import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';

class Routes {
  static const home = '/home';

  static const sqlFormatter = '/formatters/sql';
  static const jsonFormatter = '/formatters/json';
  static const htmlEncoder = "/encoders/html";
  static const textEscape = "/text/escape";
  static const markdownPreview = "/text/markdown";
  static const textDiff = "/text/diff";

  static var timestampConverter;
  static var jsonYamlConverter;
  static var cronParser;
  static var numberBase;
  static var xmlFormatter;

  static String getToolRouteByCommandLineArgs(List<String> args) {
    if (args.isNotEmpty) {
      var tools = ToolsBinding.getAllTools();
      return tools
          .firstWhere((tool) => tool.commandLineArgName == args.first,
              orElse: () => HomeTool())
          .route;
    }
    return Routes.home;
  }
}
