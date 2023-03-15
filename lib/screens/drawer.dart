import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;
  DrawerScreen({required this.onDrawerSelected});
  static const int CATEGORIES=1;
  static const int SETTINGS=2;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              AppLocalizations.of(context)!.news ,
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                 onDrawerSelected(CATEGORIES);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.green, ),
                  SizedBox(width: 20,),
                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                 onDrawerSelected(SETTINGS);

              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.settings,color: Colors.green,),
                  SizedBox(width: 20,),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
