// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geepx/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({super.key});

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
                  Navigator.of(context).push(PageAnimationTransition(
                      page: MyHomePage(),
                      pageAnimationType: BottomToTopTransition()));
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
                  Navigator.of(context).push(PageAnimationTransition(
                      page: WhishListScreen(),
                      pageAnimationType: BottomToTopTransition()));
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
      body: Center(
        child: Text('Whislist Screen'),
      ),
    );
  }
}
