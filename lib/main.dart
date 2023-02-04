// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geepx/screens/whishlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String screen = 'Home Screen';
  late DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'GEEPX',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(47, 110, 181, 2),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    SizedBox(width: 24),
                    Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    SizedBox(width: 24),
                    Icon(
                      Icons.account_circle,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    SizedBox(width: 15)
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: GNav(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            padding: EdgeInsets.all(12),
            activeColor: Color.fromRGBO(47, 110, 181, 2),
            tabBackgroundColor: Color.fromRGBO(212, 227, 255, 1),
            gap: 8,
            backgroundColor: Colors.white,
            tabs: [
              GButton(
                onPressed: () {
                  setState(() {
                    screen =
                        'Home screen'; // when i begin i will replace these setstates to the actual screens
                  });
                },
                icon: Icons.home,
                text: 'Home',
                textStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(47, 110, 181, 2),
                      fontSize: 12,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    screen = 'Whishlist screen';
                  });
                  // Navigator.of(context).push(PageAnimationTransition(
                  //     page: WhishListScreen(),
                  //     pageAnimationType: BottomToTopTransition()));
                },
                icon: Icons.favorite_border,
                text: 'Whishlist',
                textStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(47, 110, 181, 2),
                      fontSize: 12,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    screen = 'Explore screen';
                  });
                },
                icon: Icons.explore_outlined,
                text: 'Explore',
                textStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(47, 110, 181, 2),
                      fontSize: 12,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    screen = 'Cart screen';
                  });
                },
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
                textStyle: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(47, 110, 181, 2),
                      fontSize: 12,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Center(
          child: Column(
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$screen',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    AlertDialog alert = AlertDialog(
      title: Text("Exit GEEPX"),
      content: Text("Are you sure you want to exit GEEPX?."),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                exit(0);
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Yes',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'No',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return Future.value(true);
  }
}
