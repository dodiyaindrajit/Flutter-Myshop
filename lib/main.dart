import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Previously it was implemented like this
        colorScheme: ColorScheme.fromSwatch(
          accentColor: ColorConstants.kPrimaryColor, // but now it should be declared like this
        ),
        primaryColor: ColorConstants.kPrimaryColor,
        fontFamily: 'Gabriel',
      ),
      color: ColorConstants.kPrimaryColor,
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
      },
    ),
  );
}
