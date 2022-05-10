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

  bool isLogin = false;

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    isLogin = await Preferences.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    if (isNotNavigate) {
      isNotNavigate = false;

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
