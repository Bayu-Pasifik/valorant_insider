import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/weapon_controller.dart';

class WeaponView extends GetView<WeaponController> {
  const WeaponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeaponView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WeaponView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
