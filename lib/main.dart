import 'package:flutter/material.dart';
import 'package:trailapp/Screens/Showall/showalldetails.dart';
import 'package:trailapp/Screens/form/formpage.dart';
import 'Screens/Homepage/homepage.dart';
import 'Screens/form/formpage.dart';

void main() {
  runApp(MyApp());
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
      routes: {
        ShowAllDetails.routeName : (context)=> ShowAllDetails(),
        FormPage.routeName: (context)=> FormPage(),
      },
      home: Homepage(),
    );
  }
}


