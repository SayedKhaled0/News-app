import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/shared/components/components.dart';

import '../../../models/Sources.dart';

class ApiManager {
  static const String Base = "newsapi.org";

  static Future<SourcesResponse> getSources(String categoryId,) async {
    var URL = Uri.https(Base, "/v2/top-headlines/sources",
        {
          "apiKey": "9df3365c1f624134b2ffac2d7fa77328","category":categoryId,});
    try {
      Response sources = await http.get(URL);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesresponse = SourcesResponse.fromJson(json);
      return sourcesresponse;
    } catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse> getNewsData({String? sourceId, language,String? searchKeyword})async{
    Uri URL=Uri.https(Base,"/v2/everything",{
      "apiKey": "9df3365c1f624134b2ffac2d7fa77328",
      "sources":sourceId,"language":language,
      "q":searchKeyword,
    });

    try{
      Response response = await http.get(URL);
      var json = jsonDecode(response.body);
      NewsResponse newsResponse=NewsResponse.fromJson(json);
      return newsResponse;
    }catch (e) {
      throw e;
    }
  }

}
