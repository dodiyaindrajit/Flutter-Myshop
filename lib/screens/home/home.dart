import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/Widgets/categories_title.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/image.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/screens/cart/cart.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.kGray,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [imageSlider(), WidgetConst.spacer(10), category(), countDownDeals(context)],
          ),
        ),
      ),
    );
  }

  Container imageSlider() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          SizedBox(
              child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: [
              "https://onlinecombooffers.files.wordpress.com/2015/08/yepme-mens-buy-1-get-1-free-offer-onlinecombooffers.jpg",
              "https://www.shopickr.com/wp-content/uploads/2015/10/amazon-india-mens-fashion-sale-clothing-2015.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfNNnAX7nz75aBkYlZmX3AhL4HEX52J-xY3Q&usqp=CAU",
            ].map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: i,
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Image.asset(ImageConstants.comingSoon),
                                errorWidget: (context, url, error) =>
                                    const FaIcon(FontAwesomeIcons.solidImages),
                              ),
                            ),
                            // Image.network(i, fit: BoxFit.fill)),
                            onTap: () {}));
                  },
                ),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }

  Column category() {
    List _categoryList = [
      [
        "Fashion",
        "https://img.icons8.com/external-flaticons-flat-flat-icons/344/external-fashion-sewing-flaticons-flat-flat-icons.png"
      ],
      [
        "Electric",
        "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/344/external-computers-office-and-office-supplies-flaticons-lineal-color-flat-icons-2.png"
      ],
      ["Mobile", "https://img.icons8.com/color/344/two-smartphones.png"],
      ["Fresh", "https://img.icons8.com/color/344/group-of-fruits.png"],
      ["Watch", "https://img.icons8.com/fluency/344/apple-watch.png"],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTitle(
          title: "CATEGORIES",
          subTitle: "SEE ALL",
          onPressed: () {},
          isSubtitle: true,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 100,
            width: 100.w,
            padding: const EdgeInsets.only(right: 20),
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return categoryItems(_categoryList[index][0], _categoryList[index][1]);
                }),
          ),
        ),
      ],
    );
  }

  Container categoryItems(String title, String imageUrl) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(2),
      child: MaterialButton(
        onPressed: () {
          pushNewScreenWithRouteSettings(context,
              screen: const CartScreen(), settings: const RouteSettings());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const FaIcon(FontAwesomeIcons.shop),
              errorWidget: (context, url, error) => const FaIcon(FontAwesomeIcons.solidImages),
            ),
            Text(title, maxLines: 1)
          ],
        ),
        color: ColorConstants.kDarkGreen.withOpacity(0.15),
        elevation: 0,
        textColor: ColorConstants.kBlack,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  Container countDownDeals(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesTitle(
            title: "Countdown Deals | Up to 80% Off",
            onPressed: () {},
          ),
          const SlideCountdownSeparated(
            duration: Duration(minutes: 130),
            height: 22,
          ),
          SizedBox(
            height: 92.w,
            child: GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ProductImage(
                    onTap: () => pushNewScreenWithRouteSettings(context,
                        screen: const CartScreen(), settings: const RouteSettings()),
                    imageUrl: "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5816.png"),
                ProductImage(
                    onTap: () => pushNewScreenWithRouteSettings(context,
                        screen: const CartScreen(), settings: const RouteSettings()),
                    imageUrl:
                        "https://www.seekpng.com/png/full/973-9736259_latest-smartphones-android-mobile-phones-at-best-chico.png"),
                ProductImage(
                    onTap: () => pushNewScreenWithRouteSettings(context,
                        screen: const CartScreen(), settings: const RouteSettings()),
                    imageUrl:
                        "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/e5881832-36f8-4c1c-a767-10f2c2a55a02_600x.png?v=1625046573"),
                ProductImage(
                    onTap: () => pushNewScreenWithRouteSettings(context,
                        screen: const CartScreen(), settings: const RouteSettings()),
                    imageUrl: "https://www.pngmart.com/files/13/Smartwatch-Gadget-PNG-Clipart.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final String title;
  final String newPrice;
  final String oldPrice;

  const ProductImage({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    this.title = "",
    this.newPrice = "",
    this.oldPrice = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(imageUrl: imageUrl),
          ),
          if (title != "")
            Text("Homeasd asd as asd asd asd asdas dasd asdas dasd asd a",
                maxLines: oldPrice != " " ? 2 : 3),
          if (title != "")
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "₹2999",
                  style: StyleConstants.textStyle18,
                ),
                Text("₹3000", style: StyleConstants.textStyleStrike16)
              ],
            ),
        ],
      ),
    );
  }
}
