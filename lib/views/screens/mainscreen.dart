import 'package:dbhiveecom/controller/mainscreen_provider.dart';
import 'package:dbhiveecom/views/reusables/botttomnav.dart';
import 'package:dbhiveecom/views/screens/cartscreen.dart';
import 'package:dbhiveecom/views/screens/homescreen.dart';
import 'package:dbhiveecom/views/screens/profilescreen.dart';
import 'package:dbhiveecom/views/screens/searchscreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//ignore: must_be_immutable

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> allPages = const [
    HomeScreen(),
    SearchScren(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        body: allPages[mainScreenNotifier.screenIndex],
        bottomNavigationBar: BottomNavigation(),
      );
    });
  }
}
