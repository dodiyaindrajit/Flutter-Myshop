import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:myshop/screens/Widgets/add_button.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _MyOrderList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyOrderList extends StatefulWidget {
  @override
  State<_MyOrderList> createState() => _MyOrderListState();
}

class _MyOrderListState extends State<_MyOrderList> {
  late FavouriteProvider _favouriteProvider;

  @override
  void initState() {
    _favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, data, child) {
        return data.getCartItems().isNotEmpty
            ? SizedBox(
                height: 85.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Favourite List", style: StyleConstants.textStyle19),
                    SizedBox(
                      height: 80.h,
                      child: ListView.separated(
                        itemCount: data.getCartItems().length,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: data.favouriteList[index].imageUrl.first,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.favouriteList[index].name,
                                              style: StyleConstants.textStyle19,
                                            ),
                                            Text(
                                              "${data.favouriteList[index].details}The Indian rupee is the official currency of India. The rupee is subdivided into 100 paise, though as of 2019, coins of denomination of 1 rupee is the lowest value in use. The issuance of the currency is controlled by the Reserve Bank of India.",
                                              style: StyleConstants.textStyle17
                                                  .copyWith(fontWeight: FontWeight.normal),
                                              maxLines: 3,
                                              overflow: TextOverflow.fade,
                                            ),
                                            Text(
                                              "₹${data.favouriteList[index].price}",
                                              style: StyleConstants.textStyle17,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Consumer<CartProvider>(builder: (context, cart, child) {
                                        return AddButton(item: data.favouriteList[index]);
                                      }),
                                      MaterialButton(
                                        minWidth: 41.w,
                                        onPressed: () {
                                          _favouriteProvider.deleteItemFromFavourite(index);
                                        },
                                        color: ColorConstants.kRed,
                                        padding: const EdgeInsets.all(10),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10))),
                                        child: Text(
                                          "Remove",
                                          style: StyleConstants.textStyle17
                                              .copyWith(color: ColorConstants.kPrimaryColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 90.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://www.saugatonline.com/images/emptywishlist.jpg",
                              width: 300,
                              errorWidget: (context, url, error) => const Icon(Icons.heart_broken),
                            ),
                            Text(
                              "You haven't purchased anything",
                              style: StyleConstants.textStyle19,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  AnimatedBottomBar.bottomBarTabController.jumpToTab(0);
                                },
                                color: ColorConstants.kDarkGreen,
                                padding: const EdgeInsets.all(15),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "START SHOPPING NOW",
                                  style: StyleConstants.textStyle17
                                      .copyWith(color: ColorConstants.kPrimaryColor),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
