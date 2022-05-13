// ignore_for_file: file_names, duplicate_ignore
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/screens/Widgets/cart_box.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:provider/provider.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.kDarkGreen,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: GestureDetector(
            onTap: () => AnimatedBottomBar.advancedDrawerController.showDrawer(),
            child: const Icon(
              Icons.menu,
              color: ColorConstants.kPrimaryColor,
              size: 25,
            ),
          ),
        ),
        actions: [
          Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, consumer, child) {
                return Text("${consumer.getCartItems().length}",
                    style: const TextStyle(color: ColorConstants.kPrimaryColor));
              },
            ),
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topStart(top: -1, start: 20),
            padding: const EdgeInsets.all(1),
            badgeColor: ColorConstants.kDarkGreen,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, size: 20),
              onPressed: () => _showBottomSheet(context),
              color: ColorConstants.kPrimaryColor,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
          )
        ],
        title: const Text(
          'My Shop',
          style: TextStyle(color: ColorConstants.kPrimaryColor),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const CartBoxList();
      },
    );
  }
}
