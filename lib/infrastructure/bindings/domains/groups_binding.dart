import 'package:dev_widgets/domain/models/groups/brazil_group.dart';
import 'package:dev_widgets/domain/models/groups/converters_group.dart';
import 'package:dev_widgets/domain/models/groups/encoders_group.dart';
import 'package:dev_widgets/domain/models/groups/formatters_group.dart';
import 'package:dev_widgets/domain/models/groups/generators_group.dart';
import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/text_group.dart';

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
