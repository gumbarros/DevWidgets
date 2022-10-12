import 'package:devtoys/domain/helpers/generators/generator.dart';
import 'package:devtoys/domain/models/tools/generators/uuid_type.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class UuidGenerator implements Generator {
  @override
  String generate({
    UuidType type = UuidType.v4,
    bool uppercase = false,
    bool hyphens = true,
  }) {
    Uuid uuid = Uuid();
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
      return "error".tr;
    }

    if (uppercase) result = result.toUpperCase();
    if (!hyphens) result = result.replaceAll('-', '');

    return result;
  }
}
