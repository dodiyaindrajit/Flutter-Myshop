import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<String> listTitle = <String>[
    'My Order',
    'My Wishlist',
    'My Cart',
    'Privacy Policy',
    'Logout from this devices',
    'Logout from all devices',
  ];

  final List listIcons = [
    const FaIcon(FontAwesomeIcons.clockRotateLeft),
    const FaIcon(FontAwesomeIcons.solidHeart),
    const FaIcon(FontAwesomeIcons.cartShopping),
    const Icon(Icons.privacy_tip_rounded),
    const Icon(Icons.exit_to_app_rounded),
    const Icon(Icons.mobile_off_rounded),
  ];

  bool isEditProfile = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: isEditProfile ? 35.h : 25.h,
                  decoration: const BoxDecoration(
                    color: ColorConstants.kDarkGreen,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Column(
                        children: [
                          TextButton.icon(
                            icon: const Icon(
                              Icons.edit,
                              color: ColorConstants.kPrimaryColor,
                              size: 20,
                            ),
                            label: Text(
                              "KarmaLn Technology",
                              style: StyleConstants.textStyle18
                                  .copyWith(color: ColorConstants.kPrimaryColor),
                            ),
                            onPressed: () {
                              setState(() {
                                isEditProfile = true;
                              });
                            },
                          ),
                          if (isEditProfile) TextField(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: listTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: StadiumBorder(),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    child: ListTile(
                      title: Text(listTitle[index]),
                      leading: listIcons[index],
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {
                        print("Click");
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
