import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
          child: RaisedButton(
            onPressed: () {
              pageController.jumpToPage(1);
            },
            child: Text('Próximo'),
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
