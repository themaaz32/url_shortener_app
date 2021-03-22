import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener_app/screens/url_shortener_screen.dart';
import 'package:url_shortener_app/screens/url_shortener_state.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => UrlShortenerState(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: UrlShortenerScreen());
  }
}
