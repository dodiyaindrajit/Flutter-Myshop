import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/screens/cart/widgets/tab_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          //TabBar - 2 Options
          tabBar(),
          const SizedBox(height: 10),
          //Main Contain
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CustomeTabView(),
                CustomeTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container tabBar() {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ColorConstants.kPrimaryColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: ColorConstants.kLightGreen,
        ),
        labelColor: ColorConstants.kDarkGreen,
        unselectedLabelColor: ColorConstants.kBlack,
        labelStyle: StyleConstants.textStyle17,
        tabs: const [
          Tab(
            text: 'WOMAN',
          ),
          Tab(
            text: 'MAN',
          ),
        ],
      ),
    );
  }
}
