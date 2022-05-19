import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/product_info.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/categories_heading.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/categories_image_title.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/imageSlider.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/product_image_info.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //[reusable] Home Page - ImageSlider Section : ImageSlider is made from CarouselSlider Package.
              const ImageSlider(),
              //Comment Constant Widgets are place under /constant/widget
              WidgetConst.heightSpacer(10),
              //Home Page - Categories Section
              category(),
              //Home Page - CountDown Deals Section
              countDownDeals(context),
              //Home Page - Specialize (men-women-electric etc...) Section
              specialize(context),
            ],
          ),
        ),
      ),
    );
  }

  Column category() {
    List categoryList = [
      ["Fashion", "https://cdn-icons-png.flaticon.com/128/3050/3050239.png"],
      ["Electric", "https://cdn-icons-png.flaticon.com/128/1055/1055687.png"],
      ["Mobile", "https://img.icons8.com/color/344/two-smartphones.png"],
      ["Fresh", "https://img.icons8.com/color/344/group-of-fruits.png"],
      ["Watch", "https://img.icons8.com/fluency/344/apple-watch.png"],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //[reusable] This will Custome Widget.
        //Categories Title widget give title to different categories cards
        //1) Title is required where as 2)subtitle is optional or Default
        CategoriesHeading(
          title: "CATEGORIES",
          subTitle: "SEE ALL",
          onPressed: () {},
          isSubtitle: true,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 11.h,
            width: 100.w,
            padding: const EdgeInsets.only(right: 20),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CategoriesImageAndTitle(
                      title: categoryList[index][0], imageUrl: categoryList[index][1]);
                }),
          ),
        ),
      ],
    );
  }

  Container countDownDeals(BuildContext context) {
    List<Item> productInfo = CatalogModel().dummyProductList;
    List counter = [0, 1, 2, 3];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.kPrimaryColor,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.01, 0.16],
          colors: [ColorConstants.kDarkGreen.withOpacity(0.8), ColorConstants.kPrimaryColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesHeading(
            title: "Countdown Deals | Up to 80% Off",
            onPressed: () {},
          ),
          const SlideCountdownSeparated(
            duration: Duration(minutes: 130),
            height: 22,
          ),
          WidgetConst.heightSpacer(20),
          SizedBox(
            height: 43.h,
            child: GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                for (int count in counter)
                  ProductImageAndInfo(
                    onTap: () => pushNewScreenWithRouteSettings(context,
                        screen: ProductInfo(item: productInfo[count], index: count),
                        settings: const RouteSettings()),
                    item: productInfo[count],
                    price: productInfo[count].price,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container specialize(BuildContext context) {
    List<Item> productInfo = CatalogModel().dummyProductList;
    productInfo.shuffle();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.kPrimaryColor,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.01, 0.2],
            colors: [ColorConstants.kDarkGreen.withOpacity(0.8), ColorConstants.kPrimaryColor],
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesHeading(
            title: "Men's collections",
            isSubtitle: true,
            subTitle: "up to 50% off",
            onPressed: () {},
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) => ProductImageAndInfo(
                onTap: () => pushNewScreenWithRouteSettings(context,
                    screen: ProductInfo(
                      item: productInfo[index],
                      index: index,
                    ),
                    settings: const RouteSettings()),
                item: productInfo[index],
                title: productInfo[index].name,
                price: productInfo[index].price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
