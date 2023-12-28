import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/player_title.dart';

import '../controllers/player_title_controller.dart';

class PlayerTitleView extends GetView<PlayerTitleController> {
  const PlayerTitleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackgroundColor,
        appBar: AppBar(
          title: Text(
            "Title Player".toUpperCase(),
            style: GoogleFonts.bowlbyOneSc(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: blackgroundColor,
        ),
        body: FutureBuilder(
          future: controller.getAllTitle(),
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
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              padding: EdgeInsets.all(10.r),
              itemBuilder: (context, index) {
                PlayerTitleModel title = snapshot.data![index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: redbackground)),
                  child: ListTile(
                    title: Text(
                      "${title.titleText}",
                      style: GoogleFonts.bowlbyOneSc(color: Colors.white),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length ?? 0,
            );
          },
        ));
  }
}
