// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:c14190040_01/pages/detail.dart';
import 'package:c14190040_01/pages/home.dart';
import 'package:c14190040_01/pages/like.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'UAS',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    Home(),
    Like(),
    Detail(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color.fromRGBO(48, 71, 94, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.emergency),
              label: "Like",
              backgroundColor: Color.fromRGBO(48, 71, 94, 1)),
        ],
      ),
    );
  }
}
