import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/src/favorite.dart';
import 'package:cafense_mobile/src/account.dart';

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
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2Fbread-gc256b67f5_1280.jpg?alt=media&token=375c42eb-8c67-4e10-8385-7cd4005eb9df",
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2Fdrink-gacaa69f6e_1280.png?alt=media&token=12404877-2763-4f08-a740-34c3e5307cc2",
    "https://firebasestorage.googleapis.com/v0/b/caffence-9cd4a.appspot.com/o/ads%2Fsmoothies-g90ec7ce75_1280.jpg?alt=media&token=8c5cf9cf-ac61-486c-a119-25d043d28f41"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo1.png'),
          backgroundColor: Color.fromRGBO(255, 237, 222, 1),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                bottom: true,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello Sam!", //retrive data from database
                          style: TextStyle(
                            fontSize: 36,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage('assets/images/menuD.png'),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),

                  //search button
                  SizedBox(
                    height: 40,
                    width: 360,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 171, 92, 1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Color.fromARGB(255, 171, 92, 1),
                              ))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            'Delight Yourself!!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
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
                                    width: 1050,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ]))));
  }
}
