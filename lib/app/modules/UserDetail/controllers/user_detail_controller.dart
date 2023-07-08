import 'package:get/get.dart';
import 'package:github_search_task/app/modules/model/user_model.dart';

class UserDetailController extends GetxController {
  late UserModel model;
  @override
  void onInit() {
    model = Get.arguments;
    print(model.toJson());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
