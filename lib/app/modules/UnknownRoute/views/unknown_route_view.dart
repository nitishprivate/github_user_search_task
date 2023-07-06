import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unknown_route_controller.dart';

class UnknownRouteView extends GetView<UnknownRouteController> {
  const UnknownRouteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnknownRouteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnknownRouteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
