// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/image.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                  errorWidget: (context, url, error) => const Icon(Icons.image),
                                ),
                              ),
                              // Image.network(i, fit: BoxFit.fill)),
                              onTap: () {}));
                    },
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
