import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
          child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children:[
                const Text("texto"),
                const Text("opa")]
          )
      ),
    );
  }
}
