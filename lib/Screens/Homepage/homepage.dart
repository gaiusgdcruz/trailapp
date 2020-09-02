
import 'package:flutter/material.dart';
import 'package:trailapp/Screens/Homepage/widgets/CustomAppBar.dart';
import 'package:trailapp/Theme/theme.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(9, 9, 65, 1)
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
          
            Icon(Icons.place,color: Colors.white),
            Text("Map View",style: TextStyle(color: Colors.white))
          ],
        ),
        
      ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    Text("City",style : smallGrey,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text('Trivandrum',style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,

                              ),
                            ),  
                          ),
                        Icon(Icons.settings)                     
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GreyBox(title: "<₹85 Lakhs>",),
                          GreyBox(title: "For Sale",),
                          GreyBox(title: "3-4 Beds",),
                          GreyBox(title: "Bathrooms",),
                        ],
                        
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Product(price: "₹80 Lakhs",place: "Trivandrum",specs: "4 Bed Rooms / 2 Bath Rooms / 1416 Sq ft",imgpath: "assets/img/home1.jpg"),
                        Product(price: "₹60 Lakhs",place: "Kazhakuttom",specs: "3 Bed Rooms / 2 Bath Rooms / 1200 Sq ft",imgpath: "assets/img/home2.jpg"),
                        Product(price: "₹35 Lakhs",place: "Attingal",specs: "2 Bed Rooms / 1 Bath Rooms / 960 Sq ft",imgpath: "assets/img/home3.jpg"),
                        
                      ],
                    )  
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    Key key,this.price,this.place,this.specs,this.imgpath,
  }) : super(key: key);

  final String price,specs,place,imgpath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(imgpath),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [                                  
                    Text(price,style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(place,style: smallGrey,
                    ),
                  ],
                ),
              ),
              Text(specs)
          ]
          ),
          Positioned(
            top: 30,
            right: 35,
            child: Container(
              child: Icon(Icons.favorite_border),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
            ))
        ],
      ),
    );
  }
}

class GreyBox extends StatelessWidget {
  const GreyBox({
    Key key,this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 0, 0, 500),
      ),
      child: Text(title,style: TextStyle(fontSize: 17),
      ),
    );
  }
}

