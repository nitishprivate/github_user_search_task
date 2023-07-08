import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserDetailView'),
        centerTitle: true,
      ),
      body: Visibility(
        replacement: const Center(child: Text("Some thing went wrong")),
        visible: controller.model != null,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  controller.model.avatarUrl ?? "",
                  height: 100,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress != null ? const Icon(Icons.person) : child;
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.person);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              controller.model.login ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
