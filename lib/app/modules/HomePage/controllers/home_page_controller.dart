import 'package:flutter/material.dart' show Text;
import 'package:get/get.dart';
import 'package:github_search_task/app/data/api_connector.dart';
import 'package:github_search_task/app/data/api_factory.dart';
import 'package:github_search_task/app/routes/app_pages.dart';

import '../../model/user_model.dart';

class HomePageController extends GetxController {
  var list = <UserModel>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;
  @override
  void onReady() {
    super.onReady();
    getUsers();
  }

  getUsers() {
    Get.find<ApiConnector>().getMethodCall(
      url: ApiFactory.getUsers,
      onSuccess: (respSuccess) {
        isLoading.value = false;
        if (respSuccess != null && respSuccess is List<dynamic>) {
          hasError.value = false;
          list.value = (respSuccess).map((e) => UserModel.fromJson(e)).toList();
        } else {
          showApiFailDialog(respSuccess.toString());
        }
      },
      onFailure: (resFailure) {
        isLoading.value = false;
        showApiFailDialog(resFailure.toString());
      },
    );
  }

  reTry() {
    hasError.value = false;
    isLoading.value = true;
    getUsers();
  }

  void handleSearchTap() {
    Get.toNamed(Routes.SEARCH_PAGE);
  }

  showApiFailDialog(String msg) {
    hasError.value = true;
    Get.defaultDialog(
      title: "API Fail",
      content: Text(msg.toString()),
    );
  }
}
