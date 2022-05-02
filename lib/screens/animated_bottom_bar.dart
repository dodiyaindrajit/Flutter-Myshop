import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:myshop/screens/favorite/favorite.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/home/widgets/app_Bar.dart';
import 'package:myshop/screens/search/search.dart';
import 'package:myshop/screens/setting/setting.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedBottomBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  static final advancedDrawerController = AdvancedDrawerController();

  final List<FaIcon> fontAwesomeIcons = [
    const FaIcon(FontAwesomeIcons.shop),
    const FaIcon(FontAwesomeIcons.cartShopping),
    const FaIcon(FontAwesomeIcons.magnifyingGlass),
    const FaIcon(FontAwesomeIcons.solidHeart),
    const FaIcon(FontAwesomeIcons.person),
  ];

  AnimatedBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const CartScreen(),
        const SearchScreen(),
        const FavoriteScreen(),
        SettingScreen(),
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

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return AdvancedDrawer(
        backdropColor: ColorConstants.kDarkGreen,
        controller: advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          backgroundColor: ColorConstants.kGray,
          appBar: const PreferredSize(preferredSize: Size(0, 40), child: CustomeAppBar()),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: StyleConstants.navigationBarStyleGray,
            sized: false,
            child: SafeArea(
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
        ),
        drawer: SafeArea(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: ColorConstants.kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(14.w),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=",
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ListView.builder(
// itemCount: _tabItemsCount,
// scrollDirection: Axis.horizontal,
// itemBuilder: (BuildContext context, int index) {
// return CustomeTabView();
// }),

// ListView.builder(
// itemCount: 15,
// scrollDirection: Axis.horizontal,
// itemBuilder: (BuildContext context, int index) {
// return tabItem("title", "");
// }),
