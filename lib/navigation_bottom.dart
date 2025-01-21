import 'package:flutter/material.dart';
import 'package:travel_app_ui_flutter/fav_screen.dart';
import 'package:travel_app_ui_flutter/home_screen.dart';
import 'package:travel_app_ui_flutter/time_screen.dart';
import 'package:travel_app_ui_flutter/user_profile_screen.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

int pageIndex = 0;
final pages = [HomeScreen(), TimeScreen(), FavScreen(), UserProfileScreen()];

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? ImageIcon(AssetImage('assets/icon home.png'))
                  : ImageIcon(
                      AssetImage('assets/icon home.png'),
                      color: Colors.black,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? ImageIcon(AssetImage('assets/icon clock (1).png'))
                  : ImageIcon(
                      AssetImage('assets/icon clock (1).png'),
                      color: Colors.black,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? ImageIcon(AssetImage('assets/heart icon.png'))
                  : ImageIcon(
                      AssetImage('assets/heart icon.png'),
                      color: Colors.black,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? ImageIcon(AssetImage('assets/icon user.png'))
                  : ImageIcon(
                      AssetImage('assets/icon user.png'),
                      color: Colors.black,
                    ),
            ),
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
