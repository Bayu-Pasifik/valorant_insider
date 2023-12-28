import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/weapon_model.dart';
import 'package:valorant_insider/app/widgets/painter.dart';

class DetailWeapon extends StatelessWidget {
  const DetailWeapon({super.key});

  @override
  Widget build(BuildContext context) {
    WeaponModel weapon = Get.arguments;
    return Scaffold(
      backgroundColor: blackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "${weapon.displayName}".toUpperCase(),
          style: GoogleFonts.bowlbyOne(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: redbackground,
      ),
      body: Stack(
        children: [
          SizedBox(
            child: CustomPaint(
              size: Size(1280.w, 300.h),
              painter: TriangleBackground(),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 400.h,
                width: 200.w,
                child: CachedNetworkImage(
                  imageUrl: "${weapon.displayIcon}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/Image_not_available.png",
                  ),
                ),
              ),
              Table(
                // border: TableBorder.all(color: Colors.white),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Name",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${weapon.displayName}",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Type",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        weapon.shopData?.category ?? " - ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Fire Rate",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${weapon.weaponStats?.fireRate ?? "0"} Rounds / sec",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Magazine",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${weapon.weaponStats?.magazineSize ?? "-"} ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Cost",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${weapon.shopData?.cost ?? "-"} ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Damages",
                    style: GoogleFonts.bowlbyOneSc(color: redbackground),
                  ),
                ),
              ),
              Table(
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Range",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Body",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Head",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Leg",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                  ]),
                  if (weapon.weaponStats?.damageRanges != null)
                    for (var damage in weapon.weaponStats!.damageRanges!)
                      TableRow(children: [
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "${damage.rangeStartMeters ?? "NaN"}"
                              " - "
                              "${damage.rangeEndMeters ?? "NaN"}",
                              style:
                                  GoogleFonts.bowlbyOneSc(color: Colors.white),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${damage.bodyDamage ?? "NaN"}",
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${damage.headDamage ?? "NaN"}",
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${damage.legDamage ?? "NaN"}",
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          ),
                        ),
                      ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Skins",
                    style: GoogleFonts.bowlbyOneSc(color: redbackground),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                // color: Colors.amber,
                child: ListView.separated(
                    padding: EdgeInsets.all(8.r),
                    separatorBuilder: (context, index) => SizedBox(width: 20.w),
                    itemBuilder: (context, index) {
                      Skin skin = weapon.skins![index];
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200.h,
                          height: 180.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: redbackground)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200.w,
                                height: 30.h,
                                // color: Colors.white,
                                child: Center(
                                  child: Text(
                                    "${skin.displayName}",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.bowlbyOneSc(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200.w,
                                height: 145.h,
                                // color: Colors.red,
                                child: CachedNetworkImage(
                                  imageUrl: "${skin.displayIcon}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/Image_not_available.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: weapon.skins?.length ?? 0,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal),
              )
            ],
          )
        ],
      ),
    );
  }
}
