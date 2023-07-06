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
      body: const Center(
        child: Text(
          'UserDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
