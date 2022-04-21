import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/screens/HomeScreen.dart';
import 'package:shop/screens/favorite_screen.dart';
import 'package:shop/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: HomeScreen(),
      routes: {
        '/favorite':(context)=>FavoriteScreen()
      },
    );
  }
}


