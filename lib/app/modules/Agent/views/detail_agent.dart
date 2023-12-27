import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/agent_model.dart';

class DetailAgent extends StatelessWidget {
  const DetailAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgentModel agent = Get.arguments;
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
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [redbackground, blackgroundColor]),
        //   ),
        // ),
      ),
      body: Stack(
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
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

class TriangleBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 70, 85)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9983333, 0);
    path_0.lineTo(size.width, size.height * 0.9985714);
    path_0.lineTo(size.width * 0.4956917, size.height * 0.4850714);
    path_0.lineTo(0, size.height * -0.0057143);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
