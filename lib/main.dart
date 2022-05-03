import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: ColorConstants.kPrimaryColor,
        ),
        primaryColor: ColorConstants.kPrimaryColor,
        fontFamily: 'Gabriel',
      ),
      color: ColorConstants.kPrimaryColor,
      routes: {
        "/": (context) => const SplashScreen(),
        "/animatedBar": (context) => AnimatedBottomBar(),
        "/home": (context) => const HomeScreen(),
      },
    ),
  );
}
