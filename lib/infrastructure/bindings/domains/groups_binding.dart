import 'package:dev_widgets/src/brazil/brazil_group.dart';
import 'package:dev_widgets/src/converters/converters_group.dart';
import 'package:dev_widgets/src/encoders/encoders_group.dart';
import 'package:dev_widgets/src/models/groups/formatters_group.dart';
import 'package:dev_widgets/src/models/groups/generators_group.dart';
import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/text/text_group.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupsBinding extends Bindings {
  static List<Group> _getAllGroups() {
    var groups = [
      ConvertersGroup(),
      EncodersGroup(),
      FormattersGroup(),
      TextGroup(),
      GeneratorsGroup(),
      BrazilGroup()
    ];

    return groups;
  }

  @override
  void dependencies() {
    Get.lazyPut<List<Group>>(() => _getAllGroups());
  }
}
