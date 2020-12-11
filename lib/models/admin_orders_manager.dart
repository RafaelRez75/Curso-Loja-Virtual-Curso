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
      for(final change in event.documentChanges){
        switch(change.type){
          case DocumentChangeType.added:
            orders.add(
                Order.fromDocument(change.document)
            );
            break;
          case DocumentChangeType.modified:
            final modOrder = orders.firstWhere(
                    (o) => o.orderId == change.document.documentID);
            modOrder.updateFromDocument(change.document);
            break;
          case DocumentChangeType.removed:
            debugPrint('Deu problema sério!!!');
            break;
        }
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
