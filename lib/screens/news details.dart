import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/NewsResponse.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "Newsdetails";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/pattern.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: Expanded(
              child: Center(
                  child: Text(
            AppLocalizations.of(context)!.news,
            style: TextStyle(fontSize: 30),
          ))),
          backgroundColor: Colors.green,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: SizedBox(
              height: 30,
            ),
          ),
        ),
        body: Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.green),
              color: Colors.transparent),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 170,
                imageUrl: articles.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Text(
                articles.author ?? "",
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              Text(
                articles.title ?? "",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              Text(
                articles.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                articles.description ?? "",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      openUrl(articles.url);
                    },
                    icon: Text(
                      AppLocalizations.of(context)!.viewfullarticals,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    label: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
