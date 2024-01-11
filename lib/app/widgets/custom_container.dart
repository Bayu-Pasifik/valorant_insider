import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/routes/app_pages.dart';

class HomeMenuContainer extends StatelessWidget {
  const HomeMenuContainer({
    required this.title,
    required this.destination,
    required this.asset,
    super.key,
  });
  final String title;
  final String destination;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => destination == "Agent"
          ? Get.toNamed(Routes.AGENT)
          : destination == "Map"
              ? Get.toNamed(Routes.MAP)
              : destination == "Weapon"
                  ? Get.toNamed(Routes.WEAPON)
                  : destination == "Buddies"
                      ? Get.toNamed(Routes.BUDDIES)
                      : destination == "playtitle"
                          ? Get.toNamed(Routes.PLAYER_TITLE)
                          : Get.toNamed(Routes.PLAYER_CARD),
      child: Container(
        height: 130.h,
        width: 200.w,
        decoration: BoxDecoration(border: Border.all(color: redbackground)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            title,
            style:
                GoogleFonts.bowlbyOneSc(color: Colors.white, fontSize: 30.sp),
          ),
          SizedBox(
            width: 140.w,
            height: 140.h,
            child: Image.asset(
              asset,
              fit: BoxFit.scaleDown,
            ),
          )
        ]),
      ),
    );
  }
}
