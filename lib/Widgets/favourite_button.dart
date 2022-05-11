import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/models/catelog.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatefulWidget {
  final Item item;

  const FavouriteButton({required this.item, Key? key}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late FavouriteProvider _favouriteProvider;
  late bool _isInFavourite = false;

  @override
  void initState() {
    _favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);
    _isInFavourite = _checkItemIsInFavourite();
    super.initState();
  }

  bool _checkItemIsInFavourite() {
    if (_favouriteProvider.getSpecificItemFromCartProvider(widget.item.id) == widget.item) {
      setState(() {});
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _isInFavourite = _checkItemIsInFavourite();
    return MaterialButton(
      color: ColorConstants.kGray,
      minWidth: 10,
      padding: const EdgeInsets.all(5),
      child: Icon(
        _checkItemIsInFavourite() ? Icons.favorite : Icons.favorite_border_rounded,
        size: 25.0,
        color: ColorConstants.kDarkGreen,
      ),
      shape: const CircleBorder(),
      onPressed: _isInFavourite
          ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "✔️ Item is already added to cart",
                    style: StyleConstants.textStyle17.copyWith(color: ColorConstants.kPrimaryColor),
                  ),
                  duration: const Duration(milliseconds: 500),
                  elevation: 5,
                  backgroundColor: ColorConstants.kDarkGreen,
                ),
              );
            }
          : () {
              _favouriteProvider.addToFavourite(widget.item);
              setState(() {});
            },
    );

    // return MaterialButton(
    //   onPressed: () {},
    //   color: ColorConstants.kGray,
    //   minWidth: 10,
    //   padding: const EdgeInsets.all(5),
    //   child: const Icon(
    //     Icons.favorite,
    //     size: 25.0,
    //     color: ColorConstants.kDarkGreen,
    //   ),
    //   shape: const CircleBorder(),
    // );
  }
}
