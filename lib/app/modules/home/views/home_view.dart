import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/routes/app_pages.dart';

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
          const SizedBox(height: 20),
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
        ],
      ),
    );
  }
}

class ContainerToClip extends StatelessWidget {
  const ContainerToClip(
    this.text,
    this.assets, {
    required this.isImageOnLeft,
    required this.to,
    super.key,
  });

  final String text;
  final String assets;
  final bool isImageOnLeft;
  final String to;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => to == "agent"
          ? Get.toNamed(Routes.AGENT)
          : to == "buddies"
              ? Get.toNamed(Routes.BUDDIES)
              : to == "map"
                  ? Get.toNamed(Routes.MAP)
                  : Get.toNamed(Routes.WEAPON),
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(20),
        // color: color,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [redbackground, blackgroundColor])),
        child: Row(
          children: [
            if (isImageOnLeft)
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(assets),
                ),
              ),
            Expanded(
              child: Text(
                text.toUpperCase(),
                style: GoogleFonts.bowlbyOneSc(color: Colors.white),
              ),
            ),
            if (!isImageOnLeft)
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(assets),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
