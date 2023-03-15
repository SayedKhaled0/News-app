
import 'package:flutter/material.dart';

import '../models/Category Model.dart';

class CategroyItem extends  StatelessWidget {

Categorydata category;
int index;
CategroyItem(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),topRight: Radius.circular(30),
      bottomLeft: index.isEven?Radius.circular(30):Radius.zero,
        bottomRight: index.isOdd?Radius.circular(30):Radius.zero

    )
      ),
      child: Column(
        children: [
          Image.asset(category.image,height: 110,fit: BoxFit.fill,),
          Expanded(child: Container(child: Center(child: Text(category.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight
          .bold,color: Colors.white),)))),
        ],
      ),
    );
  }
}
