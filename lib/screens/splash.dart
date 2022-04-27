import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/animation.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static bool isNotNavigate = true;

  @override
  Widget build(BuildContext context) {
    if (isNotNavigate) {
      isNotNavigate = false;
      Future.delayed(const Duration(seconds: 2), () {
        pushNewScreen(
          context,
          screen: AnimatedBottomBar(),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
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
