import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/Widgets/app_Bar.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:myshop/screens/favorite/favorite.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/search/search.dart';
import 'package:myshop/screens/setting/setting.dart';
import 'package:myshop/services/notificationservice.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//To make this class constant here we pass const bottomBarIconsList in constructor
class AnimatedBottomBar extends StatelessWidget {
  const AnimatedBottomBar(
      {Key? key,
      this.bottomBarIconList = const [
        Icon(Icons.shopping_basket_rounded),
        Icon(Icons.shopping_cart),
        Icon(Icons.search),
        Icon(Icons.favorite),
        Icon(Icons.person),
      ]})
      : super(key: key);

  //advancedDrawerController is marked as static to user it on other pages without passing it again and again/
  static final advancedDrawerController = AdvancedDrawerController();

  //bottomBarTabController is marked as static to user it on other pages.
  static final PersistentTabController bottomBarTabController =
      PersistentTabController(initialIndex: 0);

  final List<Icon> bottomBarIconList;

  //BottomBar screens are sequentially arranged with bottomBarItems.
  List<Widget> _bottomBarScreens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const SearchScreen(),
      const FavoriteScreen(),
      SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _bottomBarItems() {
    return [
      for (var icon in bottomBarIconList)
        PersistentBottomNavBarItem(
          icon: icon,
          activeColorPrimary: ColorConstants.kDarkGreen,
          inactiveColorPrimary: ColorConstants.kBlack,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return AdvancedDrawer(
        backdropColor: ColorConstants.kDarkGreen,
        openRatio: 0.5,
        controller: AnimatedBottomBar.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        drawer: drawerUI(),
        child: Scaffold(
          backgroundColor: ColorConstants.kGray,
          appBar: const PreferredSize(
            preferredSize: Size(0, 40),
            child: CustomeAppBar(),
          ),
          body: persistentBottomBar(context),
        ),
      );
    });
  }

  //BottomBar: Here we are using persistent Tab View is package class
  AnnotatedRegion<SystemUiOverlayStyle> persistentBottomBar(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StyleConstants.navigationBarStyleGray,
      sized: false,
      child: SafeArea(
        child: PersistentTabView(
          context,
          controller: AnimatedBottomBar.bottomBarTabController,
          screens: _bottomBarScreens(),
          items: _bottomBarItems(),
          confineInSafeArea: true,
          navBarHeight: 40,
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
          padding: const NavBarPadding.only(top: 10),
          bottomScreenMargin: 40,
        ),
      ),
    );
  }

  //Advance Drawer Ui : this drawer will connected with roots of the application.
  //so you can access it on every screen by scrolling screen horizontally.
  SafeArea drawerUI() {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: ColorConstants.kPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(80)),
              ),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(14.w),
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=",
                      height: 20.h,
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                NotificationService()
                    .showNotificationWithSound(12, "New Stock Arrived", "Shop now in my ", 5);
              },
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.favorite),
              title: const Text('Favourites'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
