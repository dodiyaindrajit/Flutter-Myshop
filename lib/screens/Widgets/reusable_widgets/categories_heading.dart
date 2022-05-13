import 'package:flutter/material.dart';

class CategoriesHeading extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() onPressed;
  final bool isSubtitle;

  const CategoriesHeading(
      {Key? key,
      required this.title,
      this.subTitle = "SEE ALL",
      required this.onPressed,
      this.isSubtitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: isSubtitle ? 0 : 10, top: isSubtitle ? 0 : 10, right: isSubtitle ? 10 : 0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        isSubtitle
            ? MaterialButton(
                onPressed: onPressed,
                padding: EdgeInsets.zero,
                minWidth: double.minPositive,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subTitle,
                      style: const TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    const Icon(Icons.chevron_right_rounded, size: 25),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
