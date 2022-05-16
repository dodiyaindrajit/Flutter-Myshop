import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/preference/preferences.dart';
import 'package:myshop/screens/OrderScreen.dart';
import 'package:myshop/screens/login-signup/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  static bool _isLogin = false;

  Future<bool> checkUserIsLogin() async{
      return await Preferences.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 41.w,
      onPressed: () async {
        _isLogin = await checkUserIsLogin();
        print("Lgin : $_isLogin");
        Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => _isLogin ? const OrderScreen() : LoginScreen() ),
        );
      },
      color: ColorConstants.kDarkGreen,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Text(
        "Buy Now",
        style: StyleConstants.textStyle17.copyWith(color: ColorConstants.kPrimaryColor),
      ),
    );
  }
}