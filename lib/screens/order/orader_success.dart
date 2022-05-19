import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/animation.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          leading: const SizedBox(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _isShow ? 1 : 0,
                child: Column(
                  children: [
                    const Text(
                      "Your Order Placed SuccessFully",
                      style: TextStyle(color: ColorConstants.kDarkGreen, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    WidgetConst.heightSpacer(20),
                    const Text(
                      "checkout details in order status from settings",
                      style: TextStyle(color: ColorConstants.kBlack, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Lottie.asset(AnimationConstants.kOrderSuccess, repeat: false, onLoaded: (val) {
                Timer.periodic(
                    const Duration(seconds: 2), (Timer t) => setState(() => _isShow = true));
              }),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _isShow ? 1 : 0,
                child: Column(
                  children: [
                    MaterialButton(
                        color: ColorConstants.kDarkGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                        child: const Text(
                          "View Order Details",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          AnimatedBottomBar.bottomBarTabController.jumpToTab(4);
                        }),
                    WidgetConst.heightSpacer(20),
                    MaterialButton(
                      color: ColorConstants.kDarkGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(Icons.home, color: ColorConstants.kPrimaryColor),
                          WidgetConst.widthSpacer(10),
                          const Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                    ),
                    WidgetConst.heightSpacer(60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
