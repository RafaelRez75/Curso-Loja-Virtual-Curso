import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text("nome"),
          ),
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }
}
