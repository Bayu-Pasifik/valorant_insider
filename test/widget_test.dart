// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_insider/app/constant/constant.dart';
import 'package:valorant_insider/app/data/models/agent_model.dart';
import 'package:valorant_insider/app/data/models/weapon_model.dart';

// import 'package:valorant_insider/main.dart';

void main() async {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   // await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  Uri url = Uri.parse(urlWeapon);
  var response = await http.get(url);

  var tempdata = json.decode(response.body)["data"];
  var data = tempdata.map((e) => WeaponModel.fromJson(e));
  print(data);
  // listWeapons = List<WeaponModel>.from(data);
}
