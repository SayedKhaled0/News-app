import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/lang provider.dart';


class SettingTap extends StatelessWidget {
  final List<String> language = ["English", "Arabic"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      SizedBox(
      height: 20,
    ),
    Container(
    margin: EdgeInsets.all(10),
    child: Text(AppLocalizations.of(context)!.language,
    style: Theme.of(context).textTheme.headline6),
    ),
    Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.green)),
    child: Padding(
    padding: EdgeInsets.all(2),
    child: DropdownButton(
    value: provider.dropdownvalue == "en"
    ? AppLocalizations.of(context)!.english
        : AppLocalizations.of(context)!.arabic,
    icon: Container(
    margin: EdgeInsets.only(
    left: MediaQuery.of(context).size.width * .68),
    child: Icon(
    Icons.keyboard_arrow_down,
    size: 25,
    color: Colors.green,
    ),
    ),
    items: [
    AppLocalizations.of(context)!.english,
    AppLocalizations.of(context)!.arabic,
    ].map((String item) {
    return DropdownMenuItem(
    value: item,
    child: Container(
    margin: EdgeInsets.only(left: 10),
    child: Text(
    item,
    style: Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(
    color: provider.dropdownvalue == "en"
    ? Colors.green
        : Colors.green),
    ),
    ));
    }).toList(),
    onChanged: (String? newvalue) {
    (newvalue == AppLocalizations.of(context)!.english)
    ? provider.changeLanguage("en")
        : provider.changeLanguage("ar");
    })
    ,
    )
    ,
    ),
    ],
    );
  }
}
