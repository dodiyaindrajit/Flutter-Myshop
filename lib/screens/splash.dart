import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/animation.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/preference/preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static bool isNotNavigate = true;
  //isLogin flag maintain user login reference
  bool isLogin = false;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  //This function will get login flag value stored in shared preference
  checkLogin() async {
    isLogin = await Preferences.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    if (isNotNavigate) {
      isNotNavigate = false;
      //this function is work like a timer it will navigate new page after 2 seconds.
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, isLogin ? "/animatedBar" : "/login");
      });
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StyleConstants.navigationBarStyleWhite,
      child: Container(
        color: ColorConstants.kPrimaryColor,
        child: Center(
          child: Lottie.asset(
            AnimationConstants.kSplashScreen,
          ),
        ),
      ),
    );
  }
}
