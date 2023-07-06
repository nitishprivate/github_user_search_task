import 'package:get/get.dart';

import '../controllers/local_db_controller.dart';
import '../data/api_connector.dart';

class BinderData implements Bindings {
  @override
  void dependencies() {
    Get.put(LocalDbController(), permanent: true);
    Get.put(ApiConnector(), permanent: true);
  }
}
