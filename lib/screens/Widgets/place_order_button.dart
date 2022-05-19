import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/order/order_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:timezone/data/latest.dart' as tz;

class PlaceOrderButton extends StatefulWidget {
  const PlaceOrderButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceOrderButton> createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<PlaceOrderButton> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ColorConstants.kDarkGreen,
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Place Order",
        style: StyleConstants.textStyle17.copyWith(color: ColorConstants.kPrimaryColor),
      ),
      onPressed: () {
        pushNewScreen(
          context,
          screen: const OrderScreen(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }
}
