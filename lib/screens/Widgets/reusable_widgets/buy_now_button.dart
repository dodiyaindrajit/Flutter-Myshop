// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/preference/preferences.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:myshop/screens/login-signup/login.dart';
import 'package:myshop/screens/order/order_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyNowButton extends StatelessWidget {
  BuyNowButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;
  static bool _isLogin = false;
  late CartProvider _cartProvider;
  late FavouriteProvider _favouriteProvider;

  Future<bool> checkUserIsLogin() async {
    return await Preferences.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 41.w,
      onPressed: () async {
        _isLogin = await checkUserIsLogin();
        _isLogin
            ? Future.delayed(Duration.zero).then((_) {
                _cartProvider = Provider.of<CartProvider>(context, listen: false);
                _favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);
                _cartProvider.addToCart(item);
                _favouriteProvider.deleteItemFromFavouriteByItem(item);

                //After adding to cart item it will navigate to order page.
                pushNewScreen(
                  context,
                  screen: const OrderScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              })
            : Future.delayed(Duration.zero).then((_) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              });
      },
      color: ColorConstants.kDarkGreen,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Text(
        "Buy Now",
        style: StyleConstants.textStyle17.copyWith(color: ColorConstants.kPrimaryColor),
      ),
    );
  }
}
