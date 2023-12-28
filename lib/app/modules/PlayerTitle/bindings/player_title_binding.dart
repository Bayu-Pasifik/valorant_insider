import 'package:get/get.dart';

import '../controllers/player_title_controller.dart';

class PlayerTitleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerTitleController>(
      () => PlayerTitleController(),
    );
  }
}
