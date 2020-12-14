import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/store.dart';

class StoresManager extends ChangeNotifier{

  StoresManager(){
    _loadStoreList();
  }

  List<Store> stores = [];

  final Firestore firestore = Firestore.instance;

  void _loadStoreList() async {

    final snapshot = await firestore.collection('stores').getDocuments();

    stores = snapshot.documents.map((e) => Store.fromDocument(e)).toList();
    print(snapshot.documents.first.data);

    notifyListeners();

  }

}