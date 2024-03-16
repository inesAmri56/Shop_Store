import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  const MainscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
