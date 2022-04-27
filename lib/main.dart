import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstants.kPrimaryColor,
        fontFamily: 'Philosopher',
      ),
      // home: const Text("Run APP"),
      title: "Amit Prajapati",
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
      },
    ),
  );
}
