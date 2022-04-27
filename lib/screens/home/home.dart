import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kGray,
      body: const Text("Home Screen"),
    );
  }
}
