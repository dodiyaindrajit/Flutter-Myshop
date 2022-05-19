import 'dart:core';

import 'package:awesome_select/awesome_select.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/extensions/extensions.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:myshop/screens/Widgets/add_button.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/buy_now_button.dart';
import 'package:myshop/screens/home/favourite_button.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key, required this.item, required this.index}) : super(key: key);

  final Item item;
  final int index;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _currentImage = 0;
  int _selectedColor = 0;
  int _selectedSize = 0;

  final CarouselController _productImageSliderController = CarouselController();

  final List<List<String>> _productColors = <List<String>>[
    ["Black", "000000"],
    ["Blue", "0000FF"],
    ["Brown", "A52A2A"],
    ["Green", "008000"],
    ["Navy", "000080"],
  ];

  final List<String> _productSize = <String>["XS", "S", "X", "XX", "XXL"];

  double rating = 3.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var item =
        context.select<CatalogModel, Item>((catalog) => catalog.getByPosition(widget.item.id));

    return SingleChildScrollView(
      child: Container(
        color: ColorConstants.kGray,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.kPrimaryColor,
              ),
              child: Column(
                children: [
                  productHeader(item),
                  imageSlider(item),
                ],
              ),
            ),
            //Slider Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.item.imageUrl.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _productImageSliderController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_currentImage == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.kPrimaryColor,
              ),
              child: Column(
                children: [
                  price(item),
                  sizePicker(),
                  colorPicker(),
                  review(item),
                  details(),
                  buyButton(item),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column productHeader(Item item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name),
        WidgetConst.heightSpacer(10),
        Text(item.details,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, wordSpacing: 2)),
      ],
    );
  }

  Column imageSlider(Item item) {
    return Column(
      children: [
        //Images and Buttons
        SizedBox(
          height: 75.w,
          child: Stack(
            children: [
              //Image Slider
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    carouselController: _productImageSliderController,
                    options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      height: double.infinity,
                      padEnds: true,
                      onPageChanged: (index, reason) {
                        setState(() => _currentImage = index);
                      },
                    ),
                    items: [
                      for (var i in widget.item.imageUrl)
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          child: PinchZoom(
                              resetDuration: const Duration(milliseconds: 100),
                              maxScale: 2.5,
                              child: CachedNetworkImage(imageUrl: i)),
                        )
                    ],
                  ),
                ),
              ),
              //Share, Favourite, Offer label
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                        margin: const EdgeInsets.only(left: 5, top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25), color: ColorConstants.kRed),
                        child: const Text(
                          "23%\noff",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorConstants.kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Share.share('check out on Website https://google.com');
                        },
                        color: ColorConstants.kPrimaryColor,
                        elevation: 7,
                        minWidth: 10,
                        padding: const EdgeInsets.all(5),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.share,
                          size: 25.0,
                          color: ColorConstants.kDarkGreen,
                        ),
                      ),
                      Consumer<FavouriteProvider>(builder: (context, cart, child) {
                        return FavouriteButton(item: item);
                      }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding price(Item item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Price", style: StyleConstants.textStyle19),
          Text("₹${item.price}", style: StyleConstants.textStyle19)
        ],
      ),
    );
  }

  SmartSelect<int?> sizePicker() {
    return SmartSelect<int?>.single(
      title: 'Size',
      placeholder: 'Select Size',
      selectedValue: _selectedSize,
      onChange: (selected) => setState(() => _selectedSize = selected.value!),
      modalType: S2ModalType.bottomSheet,
      modalHeader: false,
      choiceLayout: S2ChoiceLayout.wrap,
      choiceDirection: Axis.horizontal,
      choiceItems: S2Choice.listFrom<int, String>(
        source: _productSize,
        value: (index, item) => index,
        title: (index, item) => item,
        subtitle: (index, item) => item,
        meta: (index, item) => item,
      ),
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          isTwoLine: false,
          dense: true,
          title: Text("Size", style: StyleConstants.textStyle19),
          value: Text(
            state.selected?.choice?.meta ?? "Select Size",
            style: StyleConstants.textStyle17,
          ),
        );
      },
      choiceBuilder: (context, state, choice) {
        return Card(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          color: choice.selected ? ColorConstants.kDarkGreen : ColorConstants.kPrimaryColor,
          child: InkWell(
            onTap: () {
              choice.select?.call(true);
              if (kDebugMode) {
                print(choice.title);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                choice.title ?? '',
                style: TextStyle(
                    color: choice.selected ? Colors.white : null,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  SmartSelect<int?> colorPicker() {
    return SmartSelect<int?>.single(
      title: 'Colors',
      placeholder: 'Choose Color',
      selectedValue: _selectedColor,
      onChange: (selected) => setState(() => _selectedColor = selected.value!),
      modalType: S2ModalType.bottomSheet,
      choiceLayout: S2ChoiceLayout.wrap,
      choiceDirection: Axis.horizontal,
      choiceItems: S2Choice.listFrom<int, List<String>>(
        source: _productColors,
        value: (index, item) => index,
        title: (index, item) => item[0],
        subtitle: (index, item) => item[1],
        meta: (index, item) => item,
      ),
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          isTwoLine: false,
          dense: true,
          title: Text("Colors", style: StyleConstants.textStyle19),
          value: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: HexColor(state.selected?.choice?.meta[1] ?? _productColors[0][1]),
                    borderRadius: BorderRadius.circular(20)),
                // margin: const EdgeInsets.only(top: 5),
              ),
              WidgetConst.widthSpacer(5),
              Text(
                state.selected?.choice?.meta[0] ?? "Choose Color",
                style: StyleConstants.textStyle17,
              ),
            ],
          ),
          // leading: Container(
          //   height: 30,
          //   width: 30,
          //   decoration: BoxDecoration(
          //       color: HexColor(state.selected?.choice?.meta[1] ?? _productColors[0][1]),
          //       borderRadius: BorderRadius.circular(20)),
          //   margin: const EdgeInsets.only(top: 5),
          // ),
        );
      },
      choiceBuilder: (context, state, choice) {
        return Card(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          color: choice.selected ? ColorConstants.kDarkGreen : ColorConstants.kPrimaryColor,
          child: InkWell(
            onTap: () => choice.select?.call(true),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: HexColor(choice.subtitle!),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      choice.title ?? '',
                      style: TextStyle(
                        color: choice.selected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row buyButton(Item item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<CartProvider>(builder: (context, cart, child) {
          return AddButton(item: item);
        }),
        BuyNowButton(item: item)
      ],
    );
  }

  Row details() {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
          child: Html(
            data: """
                        <h1>Product Details</h1>
                        <table>
                          <tr>
                            <th>Brand</th>
                            <td>Noise</td>
                          </tr>
                          <tr>
                            <th>Color</th>
                            <td>Rose Pink</td>
                          </tr>
                          <tr>
                            <th>Connector Type</th>
                            <td>USB</td>
                          </tr>
                          <tr>
                            <th>Water Resistance Level</th>
                            <td>Water Resistance</td>
                          </tr>
                          <tr>
                            <th>Age Range</th>
                            <td>10+</td>
                          </tr>
                        </table>
                        """,
            shrinkWrap: true,
            style: {
              "table": Style(width: 100.w),
              "td": Style(width: 40.w, fontSize: FontSize.larger),
              "th": Style(width: 40.w),
            },
          ),
        ),
      ),
    ]);
  }

  Padding review(Item item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Review", style: StyleConstants.textStyle19),
          StarRating(
            rating: rating,
            onRatingChanged: (rating) => setState(() => this.rating = rating),
            color: ColorConstants.kDarkGreen,
          ),
        ],
      ),
    );
  }
}

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: color,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return InkResponse(
      onTap: () {
        if (kDebugMode) {
          print("Calling");
        }
        onRatingChanged(index + 1.0);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }
}
