import 'package:dev_widgets/src/generators/uuid/uuid_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uuid/uuid.dart';

String generateUuid({
  UuidType type = UuidType.v4,
  bool uppercase = false,
  bool hyphens = true,
}) {
  const uuid = Uuid();
  String result = "";

  try {
    switch (type) {
      case UuidType.v1:
        result = uuid.v1();
        break;
      case UuidType.v4:
        result = uuid.v4();
        break;
      default:
        result = uuid.v4();
        break;
    }
  } on Exception catch (_) {
    return "error".tr();
  }

  if (uppercase) result = result.toUpperCase();
  if (!hyphens) result = result.replaceAll('-', '');

  return result;
}
