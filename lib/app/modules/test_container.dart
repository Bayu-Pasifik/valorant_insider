import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTransformed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Transform Animation'),
      ),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return DetailScreen();
          },
          tappable: isTransformed ? false : true,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return GestureDetector(
              onTap: openContainer,
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text(
          'Detail Screen Content',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
