import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/models/cart.dart';
import 'package:myshop/models/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:myshop/screens/home/home.dart';
import 'package:myshop/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: ColorConstants.kPrimaryColor,
          ),
          primaryColor: ColorConstants.kPrimaryColor,
          fontFamily: 'Gabriel',
        ),
        color: ColorConstants.kPrimaryColor,
        routes: {
          "/": (context) => const SplashScreen(),
          "/animatedBar": (context) => const AnimatedBottomBar(),
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
