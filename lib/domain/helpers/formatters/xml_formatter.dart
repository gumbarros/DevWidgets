import 'package:devtoys/domain/helpers/formatters/formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

class XMLFormatter implements Formatter {
  @override
  String format(String input,
      {Indentation indentation = Indentation.FourSpaces}) {
    XmlDocument? xml;

    try {
      xml = XmlDocument.parse(input);
    } on FormatException catch (_) {
      if (!Get.isSnackbarOpen)
        Get.snackbar("error".tr + "!", "invalid_xml_data".tr,
            icon: Icon(FontAwesomeIcons.triangleExclamation),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red);
    }
    if (xml != null) {
      return xml.toXmlString(
          pretty: indentation != Indentation.Compact,
          indent: indentation.toString());
    } else {
      return "";
    }
  }
}
