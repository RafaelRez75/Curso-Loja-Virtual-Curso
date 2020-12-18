import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'address.dart';
class User {
  User({this.email, this.password, this.name, this.id});
  User.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    name = document.data['name'] as String;
    email = document.data['email'] as String;
    if(document.data.containsKey('address')){
     address = Address.fromMap(document.data['address'] as Map<String, dynamic>);
    }
  }

  String id;
  String name;
  String email;
  String password;
  String confirmPassword;
  Address address;
  bool admin = false;

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  CollectionReference get cartReference =>
      firestoreRef.collection('cart');

  CollectionReference get tokensReference =>
      firestoreRef.collection('tokens');

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      if(address!= null)
        'address': address.toMap(),
    };
  }

  Future<void> saveToken() async {
    final token = await FirebaseMessaging().getToken();
    tokensReference.document(token).setData({
    'token': token,
    'updatedAt': FieldValue.serverTimestamp(),
    'platform': Platform.operatingSystem
    });
  }

  void setAddress(Address adddress){
    this.address = adddress;
    saveData();
  }
}