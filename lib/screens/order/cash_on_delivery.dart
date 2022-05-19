import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/order/orader_success.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CashOnDeliveryButton extends StatelessWidget {
  const CashOnDeliveryButton({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipOval(
        child: Container(
          color: Colors.amber,
          padding: const EdgeInsets.all(2),
          child: const Icon(
            Icons.currency_rupee_rounded,
            color: ColorConstants.kPrimaryColor,
          ),
        ),
      ),
      title: Text("Cash On Delivery", style: StyleConstants.textStyle19),
      minLeadingWidth: 0,
      visualDensity: VisualDensity.compact,
      dense: true,
      trailing: MaterialButton(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)),
        child: const Text(
          "COD",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {
          pushNewScreen(
            context,
            screen: const OrderSuccess(),
            // withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
      ),
    );
  }
}
