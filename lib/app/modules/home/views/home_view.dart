// import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
// import 'package:valorant_insider/app/modules/Agent/views/agent_view.dart';
// import 'package:valorant_insider/app/routes/app_pages.dart';
import 'package:valorant_insider/app/widgets/custom_container.dart';

import '../controllers/home_controller.dart';
// import 'package:custom_clippers/custom_clippers.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Valorant Insider".toUpperCase(),
          style: GoogleFonts.bowlbyOneSc(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blackgroundColor,
      ),
      backgroundColor: blackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const HomeMenuContainer(
            title: "Agent",
            destination: "Agent",
            asset: "assets/images/Agent.png",
          ),
          SizedBox(height: 20.h),
          const HomeMenuContainer(
            title: "Map",
            destination: "Map",
            asset: "assets/images/map.png",
          ),
          SizedBox(height: 20.h),
          const HomeMenuContainer(
            title: "Weapon",
            destination: "Weapon",
            asset: "assets/images/weapon.png",
          ),
          SizedBox(height: 20.h),
          const HomeMenuContainer(
            title: "Buddies",
            destination: "Buddies",
            asset: "assets/images/buddies.png",
          ),
          SizedBox(height: 20.h),
          const HomeMenuContainer(
            title: "Player \n Title",
            destination: "playtitle",
            asset: "assets/images/playerTitle.png",
          ),
          SizedBox(height: 20.h),
          const HomeMenuContainer(
            title: "Player \n Card",
            destination: "playcard",
            asset: "assets/images/playercard.png",
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
