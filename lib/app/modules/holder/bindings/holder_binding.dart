import 'package:get/get.dart';

import '../controllers/holder_controller.dart';

class HolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HolderController>(
      () => HolderController(),
    );
  }
}
