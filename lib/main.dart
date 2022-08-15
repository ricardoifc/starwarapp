import 'package:flutter/material.dart';
import 'package:starwarapp/View/page_splash.dart';
import 'package:starwarapp/View/page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWarApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageHome(),
      // home: const PageSplash(),
      routes: <String, WidgetBuilder>{
        PageHome.routePage: (_) => PageHome(),
      }
      );
    }
}
