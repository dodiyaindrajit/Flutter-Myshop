import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/models/cart/cart.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:myshop/screens/login-signup/login.dart';
import 'package:myshop/screens/splash.dart';
import 'package:myshop/services/notificationservice.dart';
import 'package:provider/provider.dart';

void main() {
  //App is Only Available in portraitUp Mode. setPreferredOrientations will set for IOS & Android.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //It will initialized notificationService instance
  NotificationService().initNotification();
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Cart provider will manage all functions of cart like add , delete , count the cart items
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        // Favourite Provider will manage favourite list like add update delete.
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: ColorConstants.kPrimaryColor,
            primarySwatch: ColorConstants.kDarkGreenMaterial,
          ),
          primaryColor: ColorConstants.kPrimaryColor,
          fontFamily: 'Roboto',
        ),
        color: ColorConstants.kPrimaryColor,
        //Default router is splash screen and it will call AnimatedBottomBar
        //AnimatedBottomBar will define bottomBar items and home screen is open as default screen
        //loginScreen route will we useful for navigate guest user to loginscreen
        routes: {
          "/": (context) => const SplashScreen(),
          "/animatedBar": (context) => const AnimatedBottomBar(),
          "/login": (context) => LoginScreen(),
        },
      ),
    );
  }
}
