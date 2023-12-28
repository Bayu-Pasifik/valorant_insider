import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/agent_model.dart';
import 'package:valorant_insider/app/modules/Agent/views/detail_agent.dart';

import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackgroundColor,
        appBar: AppBar(
          title: Text(
            "agent".toUpperCase(),
            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: blackgroundColor,
        ),
        body: FutureBuilder(
          future: controller.getAllAgent(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }

            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(8.r),
              itemCount: snapshot.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 1.6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                AgentModel agent = snapshot.data![index];
                return OpenContainer(
                  tappable: true,
                  transitionDuration: const Duration(milliseconds: 800),
                  closedColor: Colors.transparent,
                  openColor: Colors.transparent,
                  clipBehavior: Clip.hardEdge,

                  closedBuilder: (context, action) {
                    return Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: redbackground, width: 1)),
                      child: Column(children: [
                        Text(
                          "${agent.displayName}",
                          style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                        ),
                        SizedBox(
                          width: 220.w,
                          height: 220.h,
                          child: CachedNetworkImage(
                            imageUrl: agent.fullPortrait!,
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
                      ]),
                    );
                  },
                  openBuilder: (context, action) {
                    return DetailAgent(
                      agent: agent,
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
