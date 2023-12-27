import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_insider/app/data/models/agent_model.dart';

class AgentController extends GetxController {
  List<AgentModel> listAgent = [];
  Future<List<AgentModel>> getAllAgent() async {
    try {
      Uri url = Uri.parse(
          'https://valorant-api.com/v1/agents?isPlayableCharacter=true');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AgentModel.fromJson(e));
        listAgent = List<AgentModel>.from(data);
      }
    } catch (e) {
      listAgent = [];
      Get.snackbar("Error", e.toString());
    }
    return listAgent;
  }
}
