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
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
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

    /* return Row(
      children: [
        _itemCount != 0
            ? new IconButton(
                icon: new Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _cartProvider.decrementItemFromCartProvider(
                        _cartItem!.itemCartIndex);
                    _itemCount--;
                  });
                },
              )
            : new Container(),
        new Text(_itemCount.toString()),
        new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
              setState(() {
                _cartProvider
                    .incrementItemToCartProvider(_cartItem!.itemCartIndex);
                _itemCount++;
              });
            })
      ],
    ); */

    // return
    //   MaterialButton(
    //   onPressed: _isInCart != 0
    //       ? null
    //       : () {
    //           // If the item is not in cart, we let the user add it.
    //           // We are using context.read() here because the callback
    //           // is executed whenever the user taps the button. In other
    //           // words, it is executed outside the build method.
    //           /*    var cart = context.read<CartModel>();
    //           cart.add(item); */
    //           _cartProvider.addToCart(widget.item);
    //           setState(() {});
    //         },
    //   color: ColorConstants.kDarkGreen,
    //
    //
    //   child: _isInCart != 0 ? const Text('Item Already In Cart') : const Text('Add Item to Cart'),
    // );
  }
}
