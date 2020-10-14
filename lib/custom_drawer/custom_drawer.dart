import 'package:flutter/material.dart';
import 'file:///C:/Users/Public/loja_virtual/lib/custom_drawer/custom_drawer_header.dart';
import 'file:///C:/Users/Public/loja_virtual/lib/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 203, 236, 241),
                  Colors.white
                ] ,
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
            ),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(thickness: 2,),
              DrawerTile(iconData: Icons.home, title: 'Inicio', page: 0),
              DrawerTile(iconData: Icons.list, title: 'Produtos', page: 1,),
              DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos', page: 2),
              DrawerTile(iconData: Icons.location_on, title: 'Lojas', page: 3),
            ],
          ),
        ],
      ),
    );
  }
}
