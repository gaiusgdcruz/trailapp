
import 'package:flutter/material.dart';
import 'package:trailapp/Screens/Homepage/widgets/CustomAppBar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    Text("City",style : TextStyle(
                      color: Colors.black45,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Trivandrum",style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

