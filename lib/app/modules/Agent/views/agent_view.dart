import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agent_controller.dart';

class AgentView extends GetView<AgentController> {
  const AgentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AgentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
