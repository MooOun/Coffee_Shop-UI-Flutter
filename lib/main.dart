import 'package:drippincafe/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drippin Cafe',
      theme: ThemeData(
       brightness: Brightness.dark,
       primarySwatch: Colors.orange,
       fontFamily: 'thai'
      ),
      home: HomePage(),
    );
  }
}

