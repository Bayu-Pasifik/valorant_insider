import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/playercard_model.dart';

import '../controllers/player_card_controller.dart';

class PlayerCardView extends GetView<PlayerCardController> {
  const PlayerCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackgroundColor,
        appBar: AppBar(
          title: Text(
            "playercards".toUpperCase(),
            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: blackgroundColor,
        ),
        body: FutureBuilder(
          future: controller.getAllPlayerCard(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                  style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                ),
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
                PlayerCardModel playerCard = snapshot.data![index];
                // print(playerCard.displayIcon);
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: redbackground, width: 1)),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(children: [
                        SizedBox(
                          width: 200.w,
                          height: 20.h,
                          child: Text(
                            "${playerCard.displayName}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          height: 200.h,
                          // color: Colors.amber,
                          child: CachedNetworkImage(
                            imageUrl: playerCard.displayIcon ?? "",
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
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
