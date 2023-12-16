import 'package:dbhiveecom/controller/mainscreen_provider.dart';
import 'package:dbhiveecom/views/reusables/bottomNavWidget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNav(
                onTap: () {
                  mainScreenNotifier.screenIndex = 0;
                },
                icon: Ionicons.home,
                text1: mainScreenNotifier.screenIndex == 0 ? "Home" : "",
                color: mainScreenNotifier.screenIndex == 0
                    ? Colors.deepOrange
                    : Colors.white,
              ),
              BottomNav(
                onTap: () {
                  mainScreenNotifier.screenIndex = 1;
                },
                icon: Ionicons.search,
                text1: mainScreenNotifier.screenIndex == 1 ? "Search" : "",
                color: mainScreenNotifier.screenIndex == 1
                    ? Colors.deepOrange
                    : Colors.white,
              ),
              BottomNav(
                onTap: () {
                  mainScreenNotifier.screenIndex = 2;
                },
                icon: Ionicons.add,
                text1: mainScreenNotifier.screenIndex == 2 ? "Add" : "",
                color: mainScreenNotifier.screenIndex == 2
                    ? Colors.deepOrange
                    : Colors.white,
              ),
              BottomNav(
                onTap: () {
                  mainScreenNotifier.screenIndex = 3;
                },
                icon: Ionicons.cart,
                text1: mainScreenNotifier.screenIndex == 3 ? "Cart" : "",
                color: mainScreenNotifier.screenIndex == 3
                    ? Colors.deepOrange
                    : Colors.white,
              ),
              BottomNav(
                onTap: () {
                  mainScreenNotifier.screenIndex = 4;
                },
                icon: Ionicons.person,
                text1: mainScreenNotifier.screenIndex == 4 ? "Profile" : "",
                color: mainScreenNotifier.screenIndex == 4
                    ? Colors.deepOrange
                    : Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
