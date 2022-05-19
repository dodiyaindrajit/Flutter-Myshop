import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/providers/favourite_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddButton extends StatefulWidget {
  final Item item;

  const AddButton({required this.item, Key? key}) : super(key: key);

  @override
  AddButtonState createState() => AddButtonState();
}

class AddButtonState extends State<AddButton> {
  late CartProvider _cartProvider;
  late FavouriteProvider _favouriteProvider;
  late CartItem? _cartItem;
  late int _isInCart;

  @override
  void initState() {
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
    _favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);
    super.initState();
  }

  int _checkItemisInCart() {
    _cartItem = _cartProvider.getSpecificItemFromCartProvider(widget.item.id);
    return _cartItem?.quantity ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    _isInCart = _checkItemisInCart();

    return MaterialButton(
      minWidth: 41.w,
      onPressed: _isInCart != 0
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
              _cartProvider.addToCart(widget.item);
              _favouriteProvider.deleteItemFromFavouriteByItem(widget.item);
              setState(() {});
            },
      color: Colors.amber,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Text(
        _isInCart != 0 ? "Item Already" : "Add Item to Cart",
        style: StyleConstants.textStyle17.copyWith(color: ColorConstants.kPrimaryColor),
      ),
    );
  }
}
