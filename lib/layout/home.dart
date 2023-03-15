import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/models/Category%20Model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/Sources.dart';
import '../screens/categorise.dart';
import '../screens/categoryitem.dart';
import '../screens/drawer.dart';
import '../screens/CategoryDetails.dart';
import '../screens/news search.dart';
import '../screens/settingscreen.dart';
import '../screens/tapcontroller.dart';
import '../shared/network/remote/api.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName="home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png",),fit:BoxFit.cover )
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar:AppBar(
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30) )
          ),
          actions: [IconButton(onPressed: (){
            showSearch(context: context, delegate: NewsSearch());
          }, icon: Icon(Icons.search_sharp,size: 30,),
          ),
          ],


          title:Expanded(child: Center(child: Text(AppLocalizations.of(context)!.news,style: TextStyle(fontSize: 30),))),
          backgroundColor: Colors.green,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: SizedBox(
              height: 30,
            ),
          ),

        ),
        drawer: Drawer(
          child: DrawerScreen(onDrawerSelected: onDrawerSelected,),
        ),
        body:selectedDrawer==DrawerScreen.SETTINGS?
        SettingTap():
        categorydata ==null?
        CategoriseScreen(onCategoryCallBack:onCategoryCallBack,):
            CategoryDetails(category: categorydata!),
      ),
    );
  }
  Categorydata? categorydata=null;
  void onCategoryCallBack(onCategoryCallBack ){
    categorydata  =onCategoryCallBack;
setState(() {

});
  }
  int selectedDrawer=DrawerScreen.CATEGORIES;

  void onDrawerSelected(int selecteditemDrawer){
    selectedDrawer= selecteditemDrawer;
    categorydata=null;
    setState(() {
Navigator.pop(context);
    });
  }

}
