import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> with TickerProviderStateMixin {
  AnimationController? _menuIconController;

  @override
  void initState() {
    _menuIconController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.kGray,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_home,
            progress: _menuIconController!,
            color: ColorConstants.kBlack,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.cartShopping, size: 20),
            onPressed: () {},
            color: ColorConstants.kBlack,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          )
        ],
        title: const Text(
          'My Shop',
          style: TextStyle(color: ColorConstants.kBlack),
        ),
      ),
    );
  }
}
