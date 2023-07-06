import 'package:get/get.dart';

import '../controllers/unknown_route_controller.dart';

class UnknownRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnknownRouteController>(
      () => UnknownRouteController(),
    );
  }
}
