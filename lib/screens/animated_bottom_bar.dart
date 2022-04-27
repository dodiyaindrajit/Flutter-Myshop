import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:myshop/screens/favorite/favorite.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/search/search.dart';
import 'package:myshop/screens/setting/setting.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AnimatedBottomBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<FaIcon> fontAwesomeIcons = [
    const FaIcon(FontAwesomeIcons.shop),
    const FaIcon(FontAwesomeIcons.search),
    const FaIcon(FontAwesomeIcons.cartShopping),
    const FaIcon(FontAwesomeIcons.solidHeart),
    const FaIcon(FontAwesomeIcons.person),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const SearchScreen(),
        const CartScreen(),
        const FavoriteScreen(),
        const SettingScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        for (var icon in fontAwesomeIcons)
          PersistentBottomNavBarItem(
            icon: icon,
            activeColorPrimary: ColorConstants.kDarkGreen,
            inactiveColorPrimary: ColorConstants.kBlack,
          ),
      ];
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StyleConstants.navigationBarStyleGray,
      sized: false,
      child: Scaffold(
        backgroundColor: ColorConstants.kGray,
        body: SafeArea(
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            // bottomScreenMargin: 10,
            navBarHeight: 40,
            // decoration: NavBarDecoration(
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 500),
            ),
            navBarStyle: NavBarStyle.style6,
            onItemSelected: (index) {},
            backgroundColor: ColorConstants.kGray,
            // padding: NavBarPadding.only(top:10),
            bottomScreenMargin: 40,
          ),
        ),
      ),
    );
  }
}
