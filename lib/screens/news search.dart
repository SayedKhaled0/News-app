import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/NewsResponse.dart';
import '../provider/lang provider.dart';
import '../shared/network/remote/api.dart';
import 'newsdata.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){
       showResults(context);
     }, icon: Icon(Icons.search))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return IconButton(onPressed: (){
    Navigator.of(context).pop();
  }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);


   return   FutureBuilder<NewsResponse>(
     future:
     ApiManager.getNewsData(language: provider.dropdownvalue,searchKeyword: query),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Center(
             child: CircularProgressIndicator(
               color: Colors.green,
             ));
       }
       if (snapshot.hasError) {
         return Column(
           children: [
             Text(snapshot.data?.message ?? "hasError"),
             TextButton(onPressed: () {}, child: const Text("tryagain"))
           ],
         );
       }
       if (snapshot.data?.status != "ok") {
         return Column(
           children: [
             Text(snapshot.data?.message ?? "has error"),
             TextButton(onPressed: () {}, child: const Text("tryagain"))
           ],
         );
       }
       var news= snapshot.data?.articles ?? [];
       return Expanded(
         child: ListView.builder(
           itemBuilder: (context, index) {
             return NewsCard(news[index]);

           }, itemCount: news.length,
         ),
       );
     },
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
 return Center(child: Text("Suggestions"));
  }
}