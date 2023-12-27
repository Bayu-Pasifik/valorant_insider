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
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [redbackground, blackgroundColor]),
            ),
          ),
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
                // print(agent.displayIcon);
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: GestureDetector(
                          onTap: () {
                            // Get.toNamed("/",arguments: agent);
                            Get.to(const DetailAgent(), arguments: agent);
                          },
                          child: (agent.displayIcon == "")
                              ? Image.asset(
                                  "assets/images/Image_not_available.png")
                              : CachedNetworkImage(
                                  imageUrl: agent.displayIcon!,
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
                      ),
                      Center(
                        child: SizedBox(
                          width: 100.w,
                          height: 30.h,
                          // color: Colors.white,
                          child: Center(
                            child: Text(
                              "${agent.displayName}".toUpperCase(),
                              style:
                                  GoogleFonts.bowlbyOneSc(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]);
              },
            );
          },
        ));
  }
}
