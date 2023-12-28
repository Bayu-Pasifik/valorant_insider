import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/player_title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerTitleController extends GetxController {
  List<PlayerTitleModel> listTitle = [];

  Future<List<PlayerTitleModel>> getAllTitle() async {
    try {
      Uri url = Uri.parse(urlPlayerTitle);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => PlayerTitleModel.fromJson(e));
        listTitle = List<PlayerTitleModel>.from(data);
      }
    } catch (e) {
      listTitle = [];
      Get.snackbar("Error", e.toString());
    }
    return listTitle;
  }
}
