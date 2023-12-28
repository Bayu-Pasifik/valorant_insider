import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/weapon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeaponController extends GetxController {
  List<WeaponModel> listWeapons = [];
  var current = 0.obs;
  // final CarouselController imageController = CarouselController();
  Future<List<WeaponModel>> getAllWeapons() async {
    try {
      Uri url = Uri.parse(urlWeapon);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => WeaponModel.fromJson(e));
        listWeapons = List<WeaponModel>.from(data);
      }
    } catch (e) {
      listWeapons = [];
      Get.snackbar("Error", e.toString());
    }
    return listWeapons;
  }
}
