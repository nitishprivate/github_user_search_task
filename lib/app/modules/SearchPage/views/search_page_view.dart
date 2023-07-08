import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:github_search_task/app/controllers/local_db_controller.dart';
import 'package:github_search_task/app/widgets/user_card.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPageView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Visibility(
              visible: controller.isLoading.value,
              child: const LinearProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.red,
                minHeight: 3,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.textEditingC,
              onChanged: controller.handleOnChangedTF,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "type name here...",
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => Visibility(
                replacement: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      controller.list[index].avatarUrl ?? "",
                      controller.list[index].login ?? "",
                      () => controller.handleOnItemTap(index),
                    );
                  },
                ),
                visible: controller.list.isEmpty && Get.find<LocalDbController>().userModelList.isNotEmpty,
                child: ListView.builder(
                  itemCount: Get.find<LocalDbController>().userModelList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 16, bottom: 8),
                        child: Text("Recent Searches"),
                      );
                    } else {
                      index = index - 1;
                      return UserCard(
                        Get.find<LocalDbController>().userModelList[index].avatarUrl ?? "",
                        Get.find<LocalDbController>().userModelList[index].login ?? "",
                        () => controller.handleRecentTap(index),
                        fromSearch: true,
                        onRecentSearchTap: () => controller.handleRecentSearchItemTap(index),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
