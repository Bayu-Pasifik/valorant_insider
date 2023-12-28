import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:valorant_insider/app/data/models/map_models.dart';

class MapController extends GetxController {
  List<MapModel> listMap = [];
  var current = 0.obs;
  final CarouselController imageController = CarouselController();
  Future<List<MapModel>> getAllMaps() async {
    try {
      Uri url = Uri.parse(urlMap);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => MapModel.fromJson(e));
        listMap = List<MapModel>.from(data);
      }
    } catch (e) {
      listMap = [];
      Get.snackbar("Error", e.toString());
    }
    return listMap;
  }

  @override
  void dispose() {
    current.close();
    current.value = 0;
    super.dispose();
  }
}
