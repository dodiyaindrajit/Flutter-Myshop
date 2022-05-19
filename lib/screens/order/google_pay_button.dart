import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GooglePayButton extends StatelessWidget {
  const GooglePayButton({
    Key? key,
    required totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CachedNetworkImage(
          alignment: Alignment.topLeft,
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Google_Pay_Logo_%282020%29.svg/512px-Google_Pay_Logo_%282020%29.svg.png?20210501103928",
          width: 50.w,
          height: 30),
      trailing: MaterialButton(
        color: const Color(0xFF3A81F1),
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.grey)),
        child: const Text(
          "GPay",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}
