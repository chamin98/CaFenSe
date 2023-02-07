import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/src/favourites/favorite.dart';
import 'package:cafense_mobile/src/account/account.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({Key? key}) : super(key: key);

  @override
  _bottomNavbarState createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int selectedPage = 0;

  final _pageOptions = [home(), favorite(), account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOT"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Account"),
        ],
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        backgroundColor: Color.fromRGBO(240, 119, 73, 1),
        selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.74),
      ),
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final List<String> imageList = [
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2FLetter%20-%201.png?alt=media&token=1e2cf8a6-5843-42f4-81da-6813a03bac64",
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2Fbread-gc256b67f5_1280.jpg?alt=media&token=375c42eb-8c67-4e10-8385-7cd4005eb9df",
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2FLetter%20-%202.png?alt=media&token=16adbd4e-aa8a-45af-85e4-6c3710944ed8",
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2Fsmoothies-g90ec7ce75_1280.jpg?alt=media&token=8c5cf9cf-ac61-486c-a119-25d043d28f41"
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 237, 222, 1),
        appBar: AppBar(
          title: Image.asset('assets/images/logo1.png'),
          backgroundColor: Color.fromRGBO(255, 237, 222, 1),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          left: true,
          right: true,
          bottom: true,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${(user!.displayName)}!", //retrive data from database
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: user.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : AssetImage('assets/images/menuD.png')
                            as ImageProvider,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //menu
            Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/lunch');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(245, 182, 123, 1)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_restaurant_sharp),
                          Text('Lunch'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //beverages
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/beverages');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(245, 182, 123, 1)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_drink_sharp),
                          Text('Beverages'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //fastfoods
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/fastfoods');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(245, 182, 123, 1)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fastfood_sharp),
                          Text('Fast Foods'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //desserts
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/desserts');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(245, 182, 123, 1)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.icecream_sharp),
                          Text('Deserts'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            //slider
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: imageList
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              e,
                              width: 1000,
                              height: 250,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ]),
        )));
  }
}
