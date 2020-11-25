import 'package:flutter/material.dart';

class ImageSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: (){},
      builder: (_) =>
       Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.photo_library),
            )
          ],
        ),
    );
  }
}
