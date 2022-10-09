import 'package:devtoys/domain/helpers/formatters/formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

class XMLFormatter implements Formatter {
  @override
  String format(String input,
      {Indentation indentation = Indentation.fourSpaces}) {
    XmlDocument? xml;

    try {
      xml = XmlDocument.parse(input);
    } on FormatException catch (_) {
      return "invalid_xml_data".tr;
    }

    return xml.toXmlString(
        pretty: indentation != Indentation.compact,
        indent: indentation.toString());
  }
}
