import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RazorPayButton extends StatefulWidget {
  const RazorPayButton({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  final double totalAmount;

  @override
  State<RazorPayButton> createState() => _RazorPayButtonState();
}

class _RazorPayButtonState extends State<RazorPayButton> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CachedNetworkImage(
          alignment: Alignment.topLeft,
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/8/89/Razorpay_logo.svg/800px-Razorpay_logo.svg.png?20171127075036",
          width: 50.w,
          height: 30),
      trailing: MaterialButton(
        color: const Color.fromRGBO(16, 37, 81, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: const Text(
          "RazorPay",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {
          var options = {
            'key': 'rzp_test_xSdFNb0dDSXD55',
            'amount': (widget.totalAmount * 100).toString(), //in the smallest currency sub-unit.
            'name': 'My Shop KarmaLeen',
            // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
            'description': 'One Flutter Application',
            'timeout': 300, // in seconds
            'prefill': {'contact': '9106129524', 'email': 'karmatest@gmail.com'}
          };
          _razorpay.open(options);
        },
      ),
    );
  }
}
