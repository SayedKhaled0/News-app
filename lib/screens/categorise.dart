import 'package:flutter/material.dart';

import '../models/Category Model.dart';
import 'categoryitem.dart';

class CategoriseScreen extends  StatelessWidget {
 Function onCategoryCallBack;
 CategoriseScreen({required this.onCategoryCallBack});

  @override
  Widget build(BuildContext context) {
    var categories=Categorydata.getCategories(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover)
      ),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Center(child: Text("Pick Your Category Of Interest",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey.shade700),)),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18) ,
              itemBuilder: (context,index){
              return InkWell(
                onTap:(){
                  onCategoryCallBack(categories[index]);


                } ,
                  child: CategroyItem(categories[index],index));
              },),
          )
        ],
      ),
    );
  }
}
