import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/playercard_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlayerCardController extends GetxController {
  List<PlayerCardModel> listWeapons = [];
  
  Future<List<PlayerCardModel>> getAllPlayerCard() async {
    try {
      Uri url = Uri.parse(urlPlayerCard);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => PlayerCardModel.fromJson(e));
        listWeapons = List<PlayerCardModel>.from(data);
      }
    } catch (e) {
      listWeapons = [];
      Get.snackbar("Error", e.toString());
    }
    return listWeapons;
  }
}
