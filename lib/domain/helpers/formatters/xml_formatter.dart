import 'package:dev_widgets/domain/helpers/formatters/formatter.dart';
import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

class XmlFormatter implements Formatter {
  @override
  String format(String input,
      {Indentation indentation = Indentation.fourSpaces}) {
    XmlDocument? xml;

    try {
      input = applyWebSpaceFix(input);
      xml = XmlDocument.parse(input);
    } on FormatException catch (_) {
      return "invalid_xml_data".tr;
    }

    return xml.toXmlString(
        pretty: indentation != Indentation.compact,
        indent: indentation.toString());
  }
}
