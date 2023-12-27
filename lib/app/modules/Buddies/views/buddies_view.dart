import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buddies_controller.dart';

class BuddiesView extends GetView<BuddiesController> {
  const BuddiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuddiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BuddiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
