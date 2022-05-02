// ignore_for_file: file_names, duplicate_ignore
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> with TickerProviderStateMixin {
  AnimationController? _menuIconController;

  @override
  void initState() {
    _menuIconController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    super.initState();
  }

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
            badgeContent: const Text('3', style: TextStyle(color: ColorConstants.kPrimaryColor)),
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topStart(top: -1, start: 25),
            padding: const EdgeInsets.all(1),
            badgeColor: ColorConstants.kDarkGreen,
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.cartShopping, size: 20),
              onPressed: () {},
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
}
