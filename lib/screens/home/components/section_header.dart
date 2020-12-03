import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_icon_button.dart';
import 'package:lojavirtual/models/home_manager.dart';
import 'package:lojavirtual/models/section.dart';
import 'package:provider/provider.dart';

class SectionHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final section = context.watch<Section>();
    final homeManager = context.watch<HomeManager>();
    if(homeManager.editing){
     return Row(
       children: <Widget>[
         Expanded(
           child: TextFormField(
             initialValue: section.name,
             decoration: const InputDecoration(
               hintText: 'Título',
               isDense:  true,
               border: InputBorder.none
             ),
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.w800,
               fontSize: 18,
             ),
             onChanged: (text) => section.name = text,
           ),
         ),
         CustomIconButton(
           iconData: Icons.remove,
           color: Colors.white,
           onTap:(){
              homeManager.removeSection(section);
          }
         )
       ],
     ) ;
    }else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          section.name ?? "Banana",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      );
    }
  }
}