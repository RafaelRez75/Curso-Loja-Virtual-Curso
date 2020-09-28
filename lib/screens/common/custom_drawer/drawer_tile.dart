import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context. watch<PageManager>().page;
    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
        debugPrint('toquei $page');
      },
      child: SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Icon(
                  iconData,
                  size: 32,
                  color: curPage == page ? Colors.grey[700]: Colors.blue,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16, color:  curPage == page ? Colors.grey[700] : Colors.blue),
              ),
            ],
          )),
    );
  }
}
