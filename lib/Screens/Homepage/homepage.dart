
import 'package:flutter/material.dart';
import 'package:trailapp/Screens/Homepage/widgets/CustomAppBar.dart';
import 'package:trailapp/Screens/Showall/showalldetails.dart';
import 'package:trailapp/Screens/form/formpage.dart';
import 'package:trailapp/Theme/theme.dart';
import 'package:trailapp/models/homeDataModels.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {

  void onPressedEvent (BuildContext context) {
    Navigator.of(context).pushNamed('/showalldetails');
  }

  final GlobalKey _scaffoldKey = new GlobalKey();

  List<HomeDataModel> houseData = [
    HomeDataModel(
      place: 'Trivandrum',
      price: 80,
      bathroom: 2,
      bedroom: 4 ,
      sqft: 1416,
      imgpath: 'assets/img/home1.jpg'

    ),
    HomeDataModel(
      place: 'Trivandrum',
      price: 80,
      bathroom: 2,
      bedroom: 4 ,
      sqft: 1416,
      imgpath: 'assets/img/home1.jpg'

    ),
  ];
  @override
  Widget build(BuildContext context) {
    var container = Container(
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
                    );
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: Text("Form"),
            onTap: () {
              Navigator.of(context).pushNamed(FormPage.routeName);
            },
            
          )
        ], )
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: houseData.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: () {
                            Map argumnts = {
                              'place' : houseData[index].place,
                              'price' : houseData[index].price,
                            };
                            print(argumnts);
                            Navigator.of(context).pushNamed(ShowAllDetails.routeName, arguments: argumnts);
                          },
                          child: Product(
                            price: houseData[0].price.toString()+'Lakhs',
                            place: houseData[0].place ,
                            specs: "4 Bed Rooms / 2 Bath Rooms / 1416 Sq ft",
                            imgpath: houseData[0].imgpath)
                            );
                      },
                    ),
                    container,  
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

class FloatingActionButton extends StatelessWidget {
  const FloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: const EdgeInsets.symmetric(vertical:15.0),
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

