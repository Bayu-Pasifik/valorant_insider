import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/widgets/custom_container.dart';

import '../controllers/home_controller.dart';
import 'package:custom_clippers/custom_clippers.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Valorant Guide".toUpperCase()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blackgroundColor,
      ),
      backgroundColor: blackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ClipPath(
            clipper: DirectionalWaveClipper(),
            child: const ContainerToClip(
              'Agent',
              'assets/images/Agent.png',
              isImageOnLeft: true,
              to: "agent",
            ),
          ),
          ClipPath(
            clipper: DirectionalWaveClipper(
              verticalPosition: VerticalPosition.top,
              horizontalPosition: HorizontalPosition.right,
            ),
            child: const ContainerToClip(
              'Buddies',
              'assets/images/buddies.png',
              isImageOnLeft: false,
              to: "buddies",
            ),
          ),
          SizedBox(height: 20.h),
          ClipPath(
            clipper: DirectionalWaveClipper(),
            child: const ContainerToClip(
              'Map',
              'assets/images/map.png',
              isImageOnLeft: true,
              to: "map",
            ),
          ),
          ClipPath(
            clipper: DirectionalWaveClipper(
              verticalPosition: VerticalPosition.top,
              horizontalPosition: HorizontalPosition.right,
            ),
            child: const ContainerToClip(
              'Weapon',
              'assets/images/weapon.png',
              isImageOnLeft: false,
              to: "weapon",
            ),
          ),
          SizedBox(height: 20.h),
          ClipPath(
            clipper: DirectionalWaveClipper(),
            child: const ContainerToClip(
              'Player Cards',
              'assets/images/playercard.png',
              isImageOnLeft: true,
              to: "playercard",
            ),
          ),
        ],
      ),
    );
  }
}
