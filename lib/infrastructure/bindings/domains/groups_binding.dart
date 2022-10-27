import 'package:dev_widgets/src/models/groups/brazil_group.dart';
import 'package:dev_widgets/src/models/groups/converters_group.dart';
import 'package:dev_widgets/src/models/groups/encoders_group.dart';
import 'package:dev_widgets/src/models/groups/formatters_group.dart';
import 'package:dev_widgets/src/models/groups/generators_group.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/text_group.dart';

import 'package:get/get.dart';

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
