import 'package:flutter/material.dart';

import '../models/Sources.dart';

class TapItem extends StatelessWidget {
Sources sources;
bool isSelected;
TapItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
      decoration:BoxDecoration(
        color: isSelected?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.green,
        )
      ) ,
      child: Text(sources.name??"",style: TextStyle(
        color: isSelected?Colors.white:Colors.green,
      ),),
    );
  }
}
