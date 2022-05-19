import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/preference/preferences.dart';
import 'package:myshop/screens/login-signup/login.dart';
import 'package:myshop/screens/order/order_history.dart';
import 'package:myshop/screens/setting/edit_profile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> listTitle = <String>[
    'My Order',
    'My Wishlist',
    'My Cart',
    'Privacy Policy',
    'Logout from this devices',
    'Logout from all devices',
  ];

  final List listIcons = [
    const Icon(Icons.history, color: Colors.green),
    const Icon(Icons.favorite, color: Colors.blue),
    const Icon(Icons.shopping_cart, color: Colors.brown),
    const Icon(Icons.privacy_tip_rounded, color: Colors.red),
    const Icon(Icons.exit_to_app_rounded, color: Colors.purple),
    const Icon(Icons.mobile_off_rounded, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      child: Column(
        children: [
          const EditProfile(),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: listTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return settingItems(index, context);
              },
            ),
          )
        ],
      ),
    );
  }

  Card settingItems(int index, BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: ListTile(
        title: Text(listTitle[index]),
        leading: listIcons[index],
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () async {
          //Tap On My Order
          if (index == 0) {
            pushNewScreen(
              context,
              screen: const MyOrder(),
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            return;
          }
          //Tap On Logout
          if (index == 4 || index == 5) {
            await Preferences.setLogin(false);
            Future.delayed(Duration.zero).then((_) {
              Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            });
            return;
          }
        },
      ),
    );
  }
}
