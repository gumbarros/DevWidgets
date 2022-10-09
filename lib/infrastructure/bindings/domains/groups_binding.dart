import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';

import 'package:get/get.dart';

class GroupsBinding extends Bindings {
  static List<Group> _getAllGroups() {
    var groups = [
      ConvertersGroup(),
      EncodersGroup(),
      FormattersGroup(),
      TextGroup()
    ];

    groups.sort((a, b) => a.name.compareTo(b.name));
    return groups;
  }

  @override
  void dependencies() {
    Get.lazyPut<List<Group>>(() => _getAllGroups());
  }
}
