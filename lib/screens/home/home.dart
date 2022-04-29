import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/screens/home/widgets/app_Bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 40), child: CustomeAppBar()),
      body: Container(
        color: ColorConstants.kGray,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageSlider(),
            WidgetConst.spacer(10),
            category(),
          ],
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
                                child: Image.network(i, fit: BoxFit.fill)),
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
        Text(
          "Category",
          style: StyleConstants.textStyle20,
        ),
        WidgetConst.spacer(10),
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
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.network(imageUrl), Text(title, maxLines: 1)],
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
}
