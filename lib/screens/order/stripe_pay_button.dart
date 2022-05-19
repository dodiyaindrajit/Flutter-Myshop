import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StripePayButton extends StatefulWidget {
  const StripePayButton({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  final double totalAmount;

  @override
  State<StripePayButton> createState() => _StripePayButtonState();
}

class _StripePayButtonState extends State<StripePayButton> {
  @override
  void dispose() {
    // Removes all listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CachedNetworkImage(
          alignment: Alignment.topLeft,
          imageUrl: "https://logos-world.net/wp-content/uploads/2021/03/Stripe-Logo.png",
          width: 50.w,
          height: 30),
      trailing: MaterialButton(
        color: const Color.fromRGBO(100, 91, 246, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.grey)),
        child: const Text(
          "StripePay",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {},
      ),
    );
  }
}
