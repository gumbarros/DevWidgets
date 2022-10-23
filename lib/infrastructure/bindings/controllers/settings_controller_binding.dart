import 'package:dev_widgets/presentation/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
