import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) =>
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: const Text('Câmera'),
            ),
            FlatButton(
              onPressed: () {},
              child: const Text('Galeria'),
            ),
          ],
            ),
      );
    }else{
      return CupertinoActionSheet(
        title: const Text('Selecionar Foto Para o Item'),
        message: const Text('Escolha a Origem da Foto'),
        cancelButton: CupertinoActionSheetAction(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancelar')),
        actions: <Widget>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
              onPressed: () {},
              child: const Text('Camera')),
          CupertinoActionSheetAction(
              onPressed: () {},
              child: const Text('Galeria')),
        ],
      );
    }
  }
}
