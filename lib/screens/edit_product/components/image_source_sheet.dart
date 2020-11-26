import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  ImageSourceSheet({this.onImageSelected});

  final Function(File) onImageSelected;

  final ImagePicker picker = ImagePicker();


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
              onPressed: () async{
                final PickedFile file = await picker.getImage(source: ImageSource.camera);
                onImageSelected(File(file.path));
              },
              child: const Text('Câmera'),
            ),
            FlatButton(
              onPressed: () async{
                final PickedFile file = await picker.getImage(source: ImageSource.gallery);
                onImageSelected(File(file.path));

              },
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
              onPressed: () {
              picker.getImage(source: ImageSource.camera);
              },
              child: const Text('Camera')),
          CupertinoActionSheetAction(
              onPressed: () {
                picker.getImage(source: ImageSource.gallery);
              },
              child: const Text('Galeria')),
        ],
      );
    }
  }
}
