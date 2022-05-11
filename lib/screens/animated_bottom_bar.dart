import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:myshop/screens/favorite/favorite.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/home/widgets/app_Bar.dart';
import 'package:myshop/screens/search/search.dart';
import 'package:myshop/screens/setting/setting.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedBottomBar extends StatefulWidget {
  static final advancedDrawerController = AdvancedDrawerController();
  static final userCart = FlutterCart();
  static final PersistentTabController controller = PersistentTabController(initialIndex: 0);

  const AnimatedBottomBar({Key? key}) : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {


  final List<Icon> fontAwesomeIcons = [
    const Icon(Icons.shopping_basket_rounded),
    const Icon(Icons.shopping_cart),
    const Icon(Icons.search),
    const Icon(Icons.favorite),
    const Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const HomeScreen(),
        const CartScreen(),
        const SearchScreen(),
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
        child: Scaffold(
          backgroundColor: ColorConstants.kGray,
          appBar: PreferredSize(
              preferredSize: const Size(0, 40),
              child: CustomeAppBar(
                callBackCartOpen: () => setState(() => _showBottomSheet(context)),
              )),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: StyleConstants.navigationBarStyleGray,
            sized: false,
            child: SafeArea(
              child: PersistentTabView(
                context,
                controller: AnimatedBottomBar.controller,
                screens: _buildScreens(),
                items: _navBarsItems(),
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
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
        ),
      );
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.01),
            child: DraggableScrollableSheet(
              snap: true,
              initialChildSize: 0.8,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: (_, controller) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return cart.getTotalAmount() > 0.0
                          ? Column(
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  "Cart Items",
                                  style: StyleConstants.textStyle19
                                      .copyWith(color: ColorConstants.kDarkGreen),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(32),
                                    child: _CartList(),
                                  ),
                                ),
                                const Divider(height: 2, thickness: 2, color: Colors.black),
                                //Cart Total
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total',
                                          style: TextStyle(color: Colors.grey, fontSize: 24.sp)),
                                      Consumer<CartProvider>(
                                          builder: (context, cart, child) => Text(
                                              '₹${cart.getTotalAmount().toString()}',
                                              style: StyleConstants.textStyle19))
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: AnimatedBottomBar.userCart.cartItem.length > 0
                                //       ? ListView.builder(
                                //           controller: controller,
                                //           padding: const EdgeInsets.all(10),
                                //           itemCount: AnimatedBottomBar.userCart.cartItem.length,
                                //           itemBuilder: (_, index) {
                                //             ProductDetails product = AnimatedBottomBar
                                //                 .userCart.cartItem[index].productDetails as ProductDetails;
                                //             return Card(
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(15.0),
                                //               ),
                                //               elevation: 4,
                                //               child: Column(
                                //                 mainAxisSize: MainAxisSize.min,
                                //                 children: <Widget>[
                                //                   ListTile(
                                //                     leading: Container(
                                //                         width: 48,
                                //                         height: 48,
                                //                         child: CachedNetworkImage(
                                //                             imageUrl: product.imageUrl ??
                                //                                 "https://media.istockphoto.com/vectors/shopping-cart-icon-isolated-on-white-background-vector-id1206806317?k=20&m=1206806317&s=612x612&w=0&h=waK8qOHV2Fgz2ntEWHWBQtXpNDAQ_wdhd4tkTUz6tfE=")),
                                //                     title: Text(product.name ?? "Title",
                                //                         style: const TextStyle(fontSize: 20.0)),
                                //                     subtitle: Text(product.details ?? "Details",
                                //                         style: const TextStyle(fontSize: 16.0),
                                //                         maxLines: 3),
                                //                     trailing: Container(
                                //                       height: double.infinity,
                                //                       child: IconButton(
                                //                         icon: const Icon(Icons.delete,
                                //                             size: 30, color: Colors.red),
                                //                         onPressed: () {
                                //                           AnimatedBottomBar.userCart.deleteItemFromCart(index);
                                //                         },
                                //                       ),
                                //                     ),
                                //                     contentPadding: const EdgeInsets.all(10),
                                //                   ),
                                //                 ],
                                //               ),
                                //             );
                                //           },
                                //         )
                                //       : CachedNetworkImage(
                                //           imageUrl:
                                //               "https://sethisbakery.com/assets/website/images/empty-cart.png",
                                //           fit: BoxFit.fill,
                                //         ),
                                // ),
                                SafeArea(
                                  child: MaterialButton(
                                    color: ColorConstants.kDarkGreen,
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      "Place Order",
                                      style: StyleConstants.textStyle17
                                          .copyWith(color: ColorConstants.kPrimaryColor),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  "https://sethisbakery.com/assets/website/images/empty-cart.png",
                              fit: BoxFit.cover,
                            );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    // var cart = context.watch<CartModel>();
    var cartProvider = context.watch<CartProvider>();

    return ListView.builder(
      itemCount: cartProvider.flutterCart.cartItem.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cartProvider.decrementItemFromCartProvider(index);
          },
        ),
        title: Text(
          cartProvider.flutterCart.cartItem[index].productName.toString(),
          style: itemNameStyle,
        ),
      ),
    );
  }
}
