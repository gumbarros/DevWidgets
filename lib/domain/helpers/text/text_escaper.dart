String escape(String? data) {
  if (data == null || data.isEmpty) {
    return "";
  }
  var encoded = StringBuffer();

  int i = 0;
  while (i < data.length) {
    String replacementString = "";
    int jumpLength = 0;
    if (_textMatchAtIndex(data, "\n", i)) {
      jumpLength = 1;
      replacementString = "\\n";
    } else if (_textMatchAtIndex(data, "\r", i)) {
      jumpLength = 1;
      replacementString = "\\r";
    } else if (_textMatchAtIndex(data, "\t", i)) {
      jumpLength = 1;
      replacementString = "\\t";
    } else if (_textMatchAtIndex(data, "\b", i)) {
      jumpLength = 1;
      replacementString = "\\b";
    } else if (_textMatchAtIndex(data, "\f", i)) {
      jumpLength = 1;
      replacementString = "\\f";
    } else if (_textMatchAtIndex(data, "\"", i)) {
      jumpLength = 1;
      replacementString = "\\\"";
    } else if (_textMatchAtIndex(data, "\\", i)) {
      jumpLength = 1;
      replacementString = "\\\\";
    }

    if ((replacementString.isNotEmpty) && jumpLength > 0) {
      encoded.write(replacementString);
      i += jumpLength;
    } else {
      encoded.write(data[i]);
      i++;
    }
  }

  return encoded.toString();
}

String unescape(String? data) {
  if (data == null || data.isEmpty) {
    return "";
  }
  var decoded = StringBuffer();

  int i = 0;
  while (i < data.length) {
    String replacementString = "";
    int jumpLength = 0;
    if (_textMatchAtIndex(data, "\\n", i)) {
      jumpLength = 2;
      replacementString = "\n";
    } else if (_textMatchAtIndex(data, "\\r", i)) {
      jumpLength = 2;
      replacementString = "\r";
    } else if (_textMatchAtIndex(data, "\\t", i)) {
      jumpLength = 2;
      replacementString = "\t";
    } else if (_textMatchAtIndex(data, "\\b", i)) {
      jumpLength = 2;
      replacementString = "\b";
    } else if (_textMatchAtIndex(data, "\\f", i)) {
      jumpLength = 2;
      replacementString = "\f";
    } else if (_textMatchAtIndex(data, "\\\"", i)) {
      jumpLength = 2;
      replacementString = "\"";
    } else if (_textMatchAtIndex(data, "\\\\", i)) {
      jumpLength = 2;
      replacementString = "\\";
    }

    if (replacementString.isNotEmpty && jumpLength > 0) {
      decoded.write(replacementString);
      i += jumpLength;
    } else {
      decoded.write(data[i]);
      i++;
    }
  }

  return decoded.toString();
}

bool _textMatchAtIndex(String data, String test, int startIndex) {
  if (test.isEmpty) {
    return false;
  }

  if (data.length < test.length) {
    return false;
  }

  for (int i = 0; i < test.length; i++) {
    if (data[startIndex + i] != test[i]) {
      return false;
    }
  }

  return true;
}
