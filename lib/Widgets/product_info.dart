import 'package:awesome_select/awesome_select.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

final List<String> imgList = [
  "https://m.media-amazon.com/images/I/81zLNgcvlaL._SX679_.jpg",
  "https://m.media-amazon.com/images/I/61eXLgQt7kL._SX679_.jpg",
  "https://m.media-amazon.com/images/I/61QCG3IQQbL._SX679_.jpg",
  "https://m.media-amazon.com/images/I/717qIZm-xsL._SX679_.jpg",
  "https://m.media-amazon.com/images/I/81+NQQYTwPL._SX679_.jpg"
];

enum SingingCharacter { lafayette, jefferson }

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  // simple usage

  String value = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  int? _selectedColor = 0;
  int? _selectedSize = 0;

  final List<List<String>> _colors = <List<String>>[
    ["Black", "000000"],
    ["Blue", "0000FF"],
    ["Brown", "A52A2A"],
    ["Green", "008000"],
    ["Navy", "000080"],
  ];

  final List<String> _size = <String>["XS", "S", "X", "XX", "XXL", "XXXL"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorConstants.kGray,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Product Name",
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Product Description: Noise ColorFit Ultra Smart Watch With 1.76' HD Display, Aluminiumn Alloy Body, 60 Modes, Spo2, LightWeight, Stock Market Info , Calls& Sms",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, wordSpacing: 2),
                ),
              ],
            ),
            SizedBox(
              height: 75.w,
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                          autoPlay: false,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          height: double.infinity,
                          padEnds: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: [
                          for (var i in imgList)
                            ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                child: CachedNetworkImage(
                                  imageUrl: i,
                                ))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                            margin: const EdgeInsets.only(left: 5, top: 10),
                            child: const Text(
                              "23%\noff",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorConstants.kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorConstants.kRed),
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
                            color: ColorConstants.kGray,
                            minWidth: 10,
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.share,
                              size: 25.0,
                              color: ColorConstants.kDarkGreen,
                            ),
                            shape: const CircleBorder(),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: ColorConstants.kGray,
                            minWidth: 10,
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.favorite,
                              size: 25.0,
                              color: ColorConstants.kDarkGreen,
                            ),
                            shape: const CircleBorder(),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
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
                  colorPicker(),
                  const Divider(thickness: 1, color: ColorConstants.kBlack),
                  sizePicker(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SmartSelect<int?> colorPicker() {
    return SmartSelect<int?>.single(
      title: 'Colors',
      placeholder: 'Choose Color',
      selectedValue: _selectedColor,
      onChange: (selected) => setState(() => _selectedColor = selected.value),
      modalType: S2ModalType.bottomSheet,
      choiceLayout: S2ChoiceLayout.wrap,
      choiceDirection: Axis.horizontal,
      choiceItems: S2Choice.listFrom<int, List<String>>(
        source: _colors,
        value: (index, item) => index,
        title: (index, item) => item[0],
        subtitle: (index, item) => item[1],
        meta: (index, item) => item,
      ),
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          isTwoLine: true,
          dense: true,
          title: Text("Colors", style: StyleConstants.textStyle19),
          value: Text(
            state.selected?.choice?.meta[0] ?? "Choose Color",
            style: StyleConstants.textStyle17,
          ),
          leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: HexColor(state.selected?.choice?.meta[1] ?? _colors[0][1]),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(top: 5)),
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

  SmartSelect<int?> sizePicker() {
    return SmartSelect<int?>.single(
      title: 'Size',
      placeholder: 'Select Size',
      selectedValue: _selectedSize,
      onChange: (selected) => setState(() => _selectedSize = selected.value),
      modalType: S2ModalType.bottomSheet,
      modalHeader: false,
      choiceLayout: S2ChoiceLayout.wrap,
      choiceDirection: Axis.horizontal,
      choiceItems: S2Choice.listFrom<int, String>(
        source: _size,
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
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
