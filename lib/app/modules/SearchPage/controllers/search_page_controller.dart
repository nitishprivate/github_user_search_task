import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_search_task/app/controllers/local_db_controller.dart';
import 'package:github_search_task/app/data/api_connector.dart';
import 'package:github_search_task/app/data/api_factory.dart';

import '../../../provider/de_bounce_tfs.dart';
import '../../../routes/app_pages.dart';
import '../../model/user_model.dart';

class SearchPageController extends GetxController {
  var list = <UserModel>[].obs;
  var isLoading = true.obs;

  final Debounce debounce = Debounce(const Duration(milliseconds: 600));
  var textEditingC = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    Get.find<LocalDbController>().getUserFromLocalDB().then((value) {
      isLoading.value = false;
      list.refresh();
    });
  }

  void handleOnChangedTF(String value) {
    if (value.isNotEmpty) {
      debounce(() => searchUser(value));
    } else {
      list.clear();
    }
  }

  closeDialogIfOpen() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  searchUser(String value) {
    if (textEditingC.text.isEmpty) {
      return;
    }
    closeDialogIfOpen();
    isLoading.value = true;
    Get.find<ApiConnector>().getMethodCall(
      url: ApiFactory.searchUser(value),
      onSuccess: (respSuccess) {
        isLoading.value = false;
        if (respSuccess != null && respSuccess is Map<String, dynamic> && respSuccess['items'] != null) {
          list.value = (respSuccess['items'] as List<dynamic>).map((e) => UserModel.fromJson(e)).toList();
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

  showApiFailDialog(String msg) {
    Get.defaultDialog(title: "API Fail", content: Text(msg.toString()), textCancel: "Ok");
  }

  @override
  void onClose() {
    textEditingC.dispose();
    debounce.dispose();
    super.onClose();
  }

  handleOnItemTap(int index) {
    Get.toNamed(Routes.USER_DETAIL, arguments: list[index]);
    Get.find<LocalDbController>().addUserInList(list[index]);
  }

  handleRecentTap(int index) {
    Get.toNamed(Routes.USER_DETAIL, arguments: Get.find<LocalDbController>().userModelList[index]);
  }

  void handleRecentSearchItemTap(int index) {
    textEditingC.text = Get.find<LocalDbController>().userModelList[index].login ?? "";
    searchUser(textEditingC.text);
  }
}
