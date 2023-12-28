import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/agent_model.dart';
import 'package:valorant_insider/app/widgets/painter.dart';

class DetailAgent extends StatelessWidget {
  const DetailAgent({required  this.agent, Key? key}) : super(key: key);
  final AgentModel agent;
  @override
  Widget build(BuildContext context) {
    // AgentModel agent = Get.arguments;
    return Scaffold(
      backgroundColor: blackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "${agent.displayName}".toUpperCase(),
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
                  imageUrl: "${agent.fullPortrait}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
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
                        "${agent.displayName}",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Developer",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${agent.developerName}",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Role",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: CachedNetworkImage(
                              imageUrl: "${agent.role!.displayIcon}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${agent.role!.displayName}",
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          ),
                        ),
                      ],
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
                        "${agent.description}",
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      ),
                    )
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Abilities",
                  style: GoogleFonts.bowlbyOneSc(color: redbackground),
                ),
              ),
              for (var item in agent.abilities!)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: redbackground, width: 1)),
                    child:
                        ListView(padding: const EdgeInsets.all(8), children: [
                      Text(
                        item.slot!.toUpperCase(),
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: CachedNetworkImage(
                              imageUrl: "${item.displayIcon}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                          SizedBox(width: 20.w),
                          Text(
                            item.displayName!.toUpperCase(),
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Description",
                        style: GoogleFonts.bowlbyOneSc(color: redbackground),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        item.description!,
                        style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                      )
                    ]),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
