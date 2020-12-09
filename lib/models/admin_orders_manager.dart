import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'order.dart';

class AdminOrdersManager extends ChangeNotifier {


  List<Order> orders = [];
  StreamSubscription _subscription;

  final Firestore firestore = Firestore.instance;

  // ignore: avoid_positional_boolean_parameters
  void updateAdmin(bool adminEnabled) {

    orders.clear();

    _subscription?.cancel();
    if (adminEnabled) {
      _listenToOrders();
    }
  }

  void _listenToOrders() {
    _subscription = firestore.collection('orders').snapshots().listen((event) {
      orders.clear();
      for (final doc in event.documents) {
        orders.add(Order.fromDocument(doc));
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
