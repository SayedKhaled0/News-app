import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Categorydata{
  String id;
  String title;
  String image;
  Color color;
  Categorydata(this.id,this.title,this.image,this.color);
  static List<Categorydata> getCategories(BuildContext context){
    return[
      Categorydata("sports",AppLocalizations.of(context)!.sports,"assets/images/sports.png",Color(0xFFC91C22)),
      Categorydata("business",AppLocalizations.of(context)!.business,"assets/images/bussines.png",Color(0xFFCF7E48),),
      Categorydata("general ",AppLocalizations.of(context)!.general,"assets/images/environment.png",Color(0xFF4882CF),),
      Categorydata("health",AppLocalizations.of(context)!.health,"assets/images/health.png",Color(0xFFED1E79),),
      Categorydata("science ",AppLocalizations.of(context)!.science,"assets/images/science.png",Color(0xFFE2D352),),
      Categorydata("technology",AppLocalizations.of(context)!.technology,"assets/images/Politics.png",Color(0xFF003E90),),

    ];
  }
}