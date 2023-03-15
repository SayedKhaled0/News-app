import 'package:flutter/material.dart';
import 'package:news/models/Category%20Model.dart';
import 'package:news/screens/tapcontroller.dart';
import 'package:provider/provider.dart';

import '../models/Sources.dart';
import '../provider/lang provider.dart';
import '../shared/network/remote/api.dart';

class CategoryDetails extends  StatelessWidget {
Categorydata category;

CategoryDetails({required this.category,});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category.id,),
      builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Text(snapshot.data!.message!);
        }
        if(snapshot.data?.status!="ok"){
          return Center(child: Text(snapshot.data!.message!));
        }var sources=snapshot.data?.sources??[];
        return TapController(sources);
      },);
  }
}
