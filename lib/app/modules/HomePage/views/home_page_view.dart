import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/user_card.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.handleSearchTap,
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Obx(() {
        return Visibility(
          visible: !controller.hasError.value,
          replacement: Center(
            child: ElevatedButton(onPressed: controller.reTry, child: const Text("Retry")),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Expanded(
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          controller.list[index].avatarUrl ?? "",
                          controller.list[index].login ?? "",
                          () => controller.cardTap(index),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
