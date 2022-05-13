import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/screens/Widgets/reusable_widgets/categories_heading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomeTabView extends StatelessWidget {
  const CustomeTabView({Key? key}) : super(key: key);

  final bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //ACTIVEWEAR
          CategoriesHeading(
            title: 'ACTIVEWEAR',
            subTitle: 'SHOP NOW',
            onPressed: () {},
            isSubtitle: true,
          ),
          //CARD TYPE-1
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 95.w,
              height: 35.h,
              child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 45.w,
                      height: 35.h,
                      child: Card(
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Image.network(
                                    "https://target.scene7.com/is/image/Target/GUEST_7ca7be4a-d0db-4d52-b4de-40529f25685e?wid=315&hei=315&qlt=60&fmt=pjpeg",
                                    fit: BoxFit.fill),
                                IconButton(
                                  icon: Icon(isLike ? Icons.favorite : Icons.favorite_border),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  color: isLike ? ColorConstants.kRed : ColorConstants.kBlack,
                                  onPressed: () {},
                                )
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Fit & Flare Cotton-Poplin Smocked Off-the-Shoulder ",
                                      maxLines: 2,
                                    ),
                                    Text(
                                      "\$ 299.63",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: ColorConstants.kRed,
                                      ),
                                    ),
                                    Text(
                                      "\$ 199.63",
                                      style: TextStyle(
                                        color: ColorConstants.kDarkGreen,
                                      ),
                                    ),
                                    Text(
                                      "Extra 30% Off with Code \" HURRY \"",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
