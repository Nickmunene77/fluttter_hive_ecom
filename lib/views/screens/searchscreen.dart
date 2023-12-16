import 'package:flutter/material.dart';

class SearchScren extends StatefulWidget {
  const SearchScren({super.key});

  @override
  State<SearchScren> createState() => _SearchScrenState();
}

class _SearchScrenState extends State<SearchScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}
