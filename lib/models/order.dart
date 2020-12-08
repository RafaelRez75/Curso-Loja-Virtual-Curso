import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/models/cart_product.dart';

import 'address.dart';
import 'cart_manager.dart';

class Order{
  final Firestore firestore = Firestore.instance;

  Order.fromCartManager(CartManager cartManager){
    items = List.from(cartManager.items);
    price = cartManager.totalPrice;
    userId = cartManager.user.id;
    address = cartManager.address;
  }

  void save(){

    firestore.collection('orders').document(orderId).setData(
      {
        'items': items.map((e) => e.toOrderItemMap()).toList(),
        'price': price,
        'user': userId,
        'address': address.toMap(),
      }
    );
  }

  List<CartProduct> items;
  num price;
  String orderId;
  String userId;

  Address address;

  Timestamp date;
}