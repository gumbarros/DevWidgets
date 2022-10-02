class Routes {
  static const home = '/home';

  static const sqlFormatter = '/formatters/sql';
  static const jsonFormatter = '/formatters/json';
  static const htmlEncoder = "/encoders/html";
  static const textEscape = "/text/escape";
  static const markdownPreview = "/text/markdown";

  static var timestampConverter;
  static var jsonYamlConverter;
  static var cronParser;
  static var numberBase;
  static var xmlFormatter;
}
