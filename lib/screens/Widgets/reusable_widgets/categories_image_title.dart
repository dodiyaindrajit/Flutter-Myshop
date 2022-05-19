import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesImageAndTitle extends StatelessWidget {
  const CategoriesImageAndTitle({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11.h,
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        onPressed: () {
          pushNewScreenWithRouteSettings(context,
              screen: const CartScreen(), settings: const RouteSettings());
        },
        color: ColorConstants.kDarkGreen.withOpacity(0.15),
        elevation: 0,
        textColor: ColorConstants.kBlack,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Icon(Icons.shopping_cart, size: 50),
              errorWidget: (context, url, error) => const Icon(Icons.image_not_supported, size: 50),
            ),
            Text(title, maxLines: 1)
          ],
        ),
      ),
    );
  }
}
