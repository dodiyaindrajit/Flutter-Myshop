import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StyleConstants {
  static const SystemUiOverlayStyle navigationBarStyleGray = SystemUiOverlayStyle(
    systemNavigationBarColor: ColorConstants.kGray, // Navigation bar
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle navigationBarStyleWhite = SystemUiOverlayStyle(
    systemNavigationBarColor: ColorConstants.kPrimaryColor, // Navigation bar
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );

  static TextStyle textStyle17 = TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold);
  static TextStyle textStyleStrike16 = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontSize: 16.sp,
    decorationThickness: 2,
  );

  static TextStyle textStyle19 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
}
