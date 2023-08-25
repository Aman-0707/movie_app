import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/HomePage.dart';

import 'package:movie_app/pages/Movies.dart';
import 'package:movie_app/pages/Profile.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
 List Pages= [
HomePage(),
HomePage2(),
Profile(),




];








  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         resizeToAvoidBottomInset: false,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff2e1371),          
          title: Center(child: Text('Movie App')),
        ),
        body: Pages[currentIndex],

 
        bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        index: currentIndex,
      
          height: 60,
          buttonBackgroundColor: Colors.white,
          color: Colors.white60,
          backgroundColor: Color.fromRGBO(25 , 13, 57, 0.9),
          items: <Widget>[
            Icon(Icons.home, size: 30,),
            Icon(Icons.list, size: 30),
            Icon(Icons.person, size: 30), 
          ],
        ),
      ),
    );
  }
}
