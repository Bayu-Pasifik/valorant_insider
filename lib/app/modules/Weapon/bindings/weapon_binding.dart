import 'package:get/get.dart';

import '../controllers/weapon_controller.dart';

class WeaponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeaponController>(
      () => WeaponController(),
    );
  }
}
