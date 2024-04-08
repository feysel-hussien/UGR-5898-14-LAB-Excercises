import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      home: ScreenX(),
    );
  }
}

class ScreenX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result = Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenY()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen X"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Next"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ScreenY(),
                      settings: const RouteSettings(arguments: "data from x")));
            }),
      ),
    );
  }
}

class ScreenY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Y"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          // Close the screen and return "Yes" as the result.
          Navigator.pop(context, 'Yes');
        },
        child: const Text('Go Back'),
      )),
    );
  }
}
