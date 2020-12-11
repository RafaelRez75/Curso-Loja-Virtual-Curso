import 'package:flutter/material.dart';
import 'package:lojavirtual/models/order.dart';
import 'package:lojavirtual/screens/orders/component/order_product_tile.dart';
class OrderTile extends StatelessWidget {
  const OrderTile(this.order, {this.showControls = false});
  final Order order;
  final bool showControls;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  order.formattedId,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'R\$ ${order.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              order.statusText,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: order.status == Status.canceled ?
                  Colors.red : primaryColor,
                  fontSize: 14
              ),
            )
          ],
        ),
        children: <Widget>[
          Column(
            children: order.items.map((e){
              return OrderProductTile(e);
            }).toList(),
          ),
          if(showControls && order.status != Status.canceled)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 52.0, left: 15),
                    child: IconButton (
                        icon: Icon(Icons.cancel),
                        color: Colors.red,
                        onPressed: order.cancel,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 52.0),
                    child: IconButton (
                        icon: Icon(Icons.arrow_left),
                        onPressed: order.back,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 52.0),
                    child: IconButton (
                        icon: Icon(Icons.arrow_right),
                        onPressed: order.advance,
                    ),
                  ),
                  IconButton (
                      icon: Icon(Icons.pin_drop),
                      onPressed: (){

                      }
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}