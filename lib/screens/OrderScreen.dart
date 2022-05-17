import 'package:flutter/material.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/screens/Widgets/app_Bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 40), child: CustomeAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select a delivery address",
                style: StyleConstants.textStyle19,
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
                                  "RECENTLY USED\nKARMALN TECHNOLOGY",
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
                        child: Text(
                          "Deliver to this address",
                          style: StyleConstants.textStyle17,
                        ),
                        color: Colors.amber,
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {},
                      ),
                      MaterialButton(
                        child: Text(
                          "Edit address",
                          style: StyleConstants.textStyle17,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.grey)),
                        minWidth: double.infinity,
                        onPressed: () {},
                      ),
                      MaterialButton(
                        child: Text(
                          "Add delivery instructions",
                          style: StyleConstants.textStyle17,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.grey)),
                        minWidth: double.infinity,
                        onPressed: () {},
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
                              child: Text(
                                "Deliver to this address",
                                style: StyleConstants.textStyle17,
                              ),
                              color: Colors.amber,
                              minWidth: double.infinity,
                              height: 40,
                              onPressed: () {},
                            ),
                            MaterialButton(
                              child: Text(
                                "Edit address",
                                style: StyleConstants.textStyle17,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.grey)),
                              minWidth: double.infinity,
                              onPressed: () {},
                            ),
                            MaterialButton(
                              child: Text(
                                "Add delivery instructions",
                                style: StyleConstants.textStyle17,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.grey)),
                              minWidth: double.infinity,
                              onPressed: () {},
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