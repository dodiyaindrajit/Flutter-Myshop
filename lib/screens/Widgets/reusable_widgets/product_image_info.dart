
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductImageAndInfo extends StatelessWidget {
  final Function() onTap;
  final Item item;
  final String title;
  final int price;
  final String details;

  const ProductImageAndInfo({
    Key? key,
    required this.onTap,
    required this.item,
    this.title = "",
    this.price = 0,
    this.details = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(imageUrl: item.imageUrl.first, width: 35.w),
          ),
          if (title != "") Text(title, maxLines: details != "" ? 2 : 3),
          if (price != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(price.toString(), style: StyleConstants.textStyle17),
                Text(price > 1000 ? (price+1000).toString() : (price+300).toString(), style: StyleConstants.textStyleStrike16)
              ],
            ),
        ],
      ),
    );
  }
}