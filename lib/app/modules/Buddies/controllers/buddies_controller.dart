import 'dart:convert';

import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/buddies_model.dart';
import 'package:http/http.dart' as http;

class BuddiesController extends GetxController {
  List<BuddiesModel> listAgent = [];
  Future<List<BuddiesModel>> getAllBuddies() async {
    try {
      Uri url = Uri.parse(urlBuddies);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => BuddiesModel.fromJson(e));
        listAgent = List<BuddiesModel>.from(data);
      }
    } catch (e) {
      listAgent = [];
      Get.snackbar("Error", e.toString());
    }
    return listAgent;
  }
}
