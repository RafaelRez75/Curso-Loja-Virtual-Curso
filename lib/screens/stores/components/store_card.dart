import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_icon_button.dart';
import 'package:lojavirtual/models/store.dart';

class StoreCard extends StatelessWidget {

  const StoreCard(this.store);

  final Store store;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: <Widget>[
             AspectRatio(
                 aspectRatio: 1.2,
                 child: Image.network(
                     store.image,
                     fit: BoxFit.cover),
             ),
          Container(
            height: 140,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        store.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        store.addressText,
                        style: const TextStyle(
                          fontSize: 15
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    Text(
                      store.openingText,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomIconButton(
                      iconData: Icons.map,
                      color: primaryColor,
                      onTap: (){

                      },
                    ),
                    CustomIconButton(
                      iconData: Icons.phone,
                      color: primaryColor,
                      onTap: (){

                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
