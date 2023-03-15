import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/NewsResponse.dart';
import 'news details.dart';

class NewsCard extends  StatelessWidget {
  Articles articles;
  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).pushNamed(NewsDetailsScreen.routeName,arguments: articles),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green),
          color: Colors.transparent
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 170,
              imageUrl:articles.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.green,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
        Text(articles.author??"",style: TextStyle(
          fontSize: 15,color: Colors.grey.shade500
        ),),
            Text(articles.title??"",style: TextStyle(
                fontSize: 17,color: Colors.black
            ),),
            Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,),


          ],
        ),
      ),
    );
  }
}
