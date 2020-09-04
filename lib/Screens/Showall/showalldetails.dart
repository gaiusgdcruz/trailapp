import 'package:flutter/material.dart';

class ShowAllDetails extends StatelessWidget {
  static const routeName = "/showalldetails";

  @override
  Widget build(BuildContext context) {
    Map argu = ModalRoute.of(context).settings.arguments;
    print(argu);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
         children: [
           Image.asset('assets/img/home1.jpg'),
           Align(
             alignment: Alignment.topLeft,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 SizedBox(height: 30),
                 IconButton(icon: Icon(Icons.arrow_back_ios),
                 onPressed: () {Navigator.of(context).pop();})
               ]
           )
           )
         ]
      ),
      const SizedBox(height: 10),
      Text(argu['place'])
    ],
      ),
    );
  }
}