import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/provider/lang%20provider.dart';
import 'package:news/screens/news%20details.dart';
import 'layout/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()),
   
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''),
      ],
      locale: Locale(provider.dropdownvalue),
      initialRoute:HomeLayout.routeName ,
      routes: {
        HomeLayout.routeName:(_)=>HomeLayout(),
        NewsDetailsScreen.routeName:(_)=>NewsDetailsScreen(),

      },
      debugShowCheckedModeBanner: false,

    );
  }

}
