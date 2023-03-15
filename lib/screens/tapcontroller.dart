import 'package:flutter/material.dart';
import 'package:news/screens/tapitem.dart';
import 'package:news/shared/network/remote/api.dart';
import 'package:provider/provider.dart';

import '../models/NewsResponse.dart';
import '../models/Sources.dart';
import '../provider/lang provider.dart';
import 'newsdata.dart';

class TapController extends StatefulWidget {
  List<Sources> sources;

  TapController(this.sources);

  @override
  State<TapController> createState() => _TapControllerState();
}

class _TapControllerState extends State<TapController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                  .map((source) => Tab(
                      child: TapItem(source,
                          widget.sources.indexOf(source) == selectedIndex)))
                  .toList(),
            )),
        FutureBuilder<NewsResponse>(
          future:
              ApiManager.getNewsData(sourceId:widget.sources[selectedIndex].id ?? "",language: provider.dropdownvalue),
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
        ),
      ],
    );
  }
}
