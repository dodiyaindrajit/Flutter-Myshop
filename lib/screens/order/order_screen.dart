import 'package:flutter/material.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/screens/order/payment_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text("Delivery Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select a delivery address",
                style: StyleConstants.textStyle19.copyWith(fontSize: 20.sp),
              ),
              WidgetConst.heightSpacer(10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(icon: const Icon(Icons.ac_unit), onPressed: () {}),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Recently Used\nKARMALN TECHNOLOGY",
                                  style: StyleConstants.textStyle17,
                                ),
                                WidgetConst.heightSpacer(5),
                                const Text(
                                  "City Center 2, Science City Road , Ahmedabad, Gujarat , 382470",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      WidgetConst.heightSpacer(10),
                      MaterialButton(
                        color: Colors.amber,
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          pushNewScreen(
                            context,
                            screen: const PaymentScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(
                          "Deliver to this address",
                          style: StyleConstants.textStyle17,
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.grey)),
                        minWidth: double.infinity,
                        onPressed: () {},
                        child: Text(
                          "Edit address",
                          style: StyleConstants.textStyle17,
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.grey)),
                        minWidth: double.infinity,
                        onPressed: () {},
                        child: Text(
                          "Add delivery instructions",
                          style: StyleConstants.textStyle17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(icon: const Icon(Icons.ac_unit), onPressed: () {}),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prjapati Amit Baldevbhai",
                                  style: StyleConstants.textStyle17,
                                ),
                                WidgetConst.heightSpacer(5),
                                const Text(
                                  "City Center 2, Science City Road , Ahmedabad, Gujarat , 382470",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      WidgetConst.heightSpacer(10),
                      Visibility(
                        visible: false,
                        child: Column(
                          children: [
                            MaterialButton(
                              color: Colors.amber,
                              minWidth: double.infinity,
                              height: 40,
                              onPressed: () {},
                              child: Text(
                                "Deliver to this address",
                                style: StyleConstants.textStyle17,
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.grey)),
                              minWidth: double.infinity,
                              onPressed: () {},
                              child: Text(
                                "Edit address",
                                style: StyleConstants.textStyle17,
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.grey)),
                              minWidth: double.infinity,
                              onPressed: () {},
                              child: Text(
                                "Add delivery instructions",
                                style: StyleConstants.textStyle17,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
