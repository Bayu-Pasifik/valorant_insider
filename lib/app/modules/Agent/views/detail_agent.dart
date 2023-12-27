import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/agent_model.dart';

class DetailAgent extends StatelessWidget {
  const DetailAgent({super.key});

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
        // backgroundColor: blackgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [redbackground, blackgroundColor]),
          ),
        ),
      ),
    );
  }
}
