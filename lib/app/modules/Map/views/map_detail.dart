import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/map_models.dart';
import 'package:valorant_insider/app/modules/Map/controllers/map_controller.dart';
import 'package:valorant_insider/app/widgets/painter.dart';

class DetailMap extends GetView<MapController> {
  const DetailMap({required this.map,super.key});
  final MapModel map;
  @override
  Widget build(BuildContext context) {
    // MapModel map = Get.arguments;
    var imageList = [map.displayIcon, map.listViewIcon, map.splash];
    final List<Widget> imageSliders = imageList
        .map((item) => Container(
              margin: EdgeInsets.all(5.w),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: CachedNetworkImage(
                    imageUrl: "$item",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/Image_not_available.png",
                    ),
                  )),
            ))
        .toList();
    return Scaffold(
      backgroundColor: blackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "${map.displayName}".toUpperCase(),
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
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 300.h,
                  width: 200.w,
                  // color: Colors.amber,
                  child: (imageList.length >= 3)
                      ? Column(children: [
                          Expanded(
                            child: CarouselSlider(
                              items: imageSliders,
                              carouselController: controller.imageController,
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 1.4,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: true,
                                  initialPage: 0,
                                  onPageChanged: (index, reason) {
                                    controller.current.value = index;
                                  }),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => controller.imageController
                                    .animateToPage(entry.key),
                                child: Obx(() => Container(
                                      width: 12.0.w,
                                      height: 12.0.h,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (redbackground).withOpacity(
                                              controller.current.value ==
                                                      entry.key
                                                  ? 0.9
                                                  : 0.4)),
                                    )),
                              );
                            }).toList(),
                          ),
                        ])
                      : CachedNetworkImage(
                          imageUrl: "${map.splash}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/Image_not_available.png",
                          ),
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
                        "${map.displayName}",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Tactical Description",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (map.tacticalDescription != null)
                            ? "${map.tacticalDescription}"
                            : " - ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Coordinat",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (map.coordinates != null)
                            ? "${map.coordinates}"
                            : " - ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Description",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (map.narrativeDescription != null)
                            ? "${map.narrativeDescription}"
                            : " - ",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
