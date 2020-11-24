import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_product.dart';
import 'file:///C:/Users/Public/loja_virtual/lib/common/custom_icon_button.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {

  const CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(cartProduct.product.images.first),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cartProduct.product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Tamanho: ${cartProduct.size}',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                      Consumer<CartProduct>(
                          builder: (_, cartProduct, __){
                            if(cartProduct.hasStock){
                            return Text(
                              'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            );
                            }else{
                              return Text(
                                'Sem Estoque Disponível',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13
                                ),
                              );
                            }
                        }
                      )
                    ],
                  ),
                ),
              ),
              Consumer<CartProduct>(
                builder: (_, cartProduct, __){
                  return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        children: <Widget>[
                          CustomIconButton(
                            iconData: Icons.add,
                            color: Theme.of(context).primaryColor,
                            onTap: cartProduct.increment,

                          ),
                          Text(
                            '${cartProduct.quantity}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          CustomIconButton(
                            iconData: Icons.remove,
                            color: cartProduct.quantity > 1 ? Theme.of(context).primaryColor : Colors.red,
                            onTap: cartProduct.decrement,
                          ),
                        ],
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}