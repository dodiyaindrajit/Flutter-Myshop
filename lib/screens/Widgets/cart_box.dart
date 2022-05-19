import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/screens/Widgets/place_order_button.dart';
import 'package:provider/provider.dart';

class CartBoxList extends StatelessWidget {
  const CartBoxList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.01),
        child: DraggableScrollableSheet(
          snap: true,
          initialChildSize: 0.8,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (_, controller) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return cart.getTotalAmount() > 0.0
                      ? Column(
                          children: [
                            Icon(Icons.remove, color: Colors.grey[600]),
                            Text("Cart Items",
                                style: StyleConstants.textStyle19
                                    .copyWith(color: ColorConstants.kDarkGreen)),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                                  child: _CartList()),
                            ),
                            const Divider(height: 2, thickness: 2, color: Colors.black),
                            //Cart Total
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total',
                                      style: TextStyle(color: Colors.grey, fontSize: 30)),
                                  Consumer<CartProvider>(
                                      builder: (context, cart, child) => Text(
                                          '₹${cart.getTotalAmount().toString()}',
                                          style: StyleConstants.textStyle19))
                                ],
                              ),
                            ),
                            const SafeArea(
                              child: PlaceOrderButton(),
                            ),
                          ],
                        )
                      : CachedNetworkImage(
                          imageUrl: "https://sethisbakery.com/assets/website/images/empty-cart.png",
                          fit: BoxFit.cover,
                        );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = context.watch<CartProvider>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cartProvider.flutterCart.cartItem.length,
      itemBuilder: (_, index) {
        CartItem product = cartProvider.flutterCart.cartItem[index];
        Item item = product.productDetails as Item;
        return Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: CachedNetworkImage(imageUrl: item.imageUrl.first),
              ),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.productName ?? "Title", style: StyleConstants.textStyle19),
                      const SizedBox(height: 3),
                      Text("Price: ${item.price.toString()}", style: StyleConstants.textStyle17),
                      const SizedBox(height: 3),
                      Text(
                          "${item.details}Either the assertion indicates an error in the framework itself, or we should provide substantially more information in this error message to help you determine and fix the underlying cause.",
                          style: const TextStyle(fontSize: 16.0),
                          maxLines: 3),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          cartProvider.deleteItemFromCart(index);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: IconButton(
                              icon: const Icon(Icons.remove, color: Colors.red),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                cartProvider.decrementItemFromCartProvider(index);
                              }),
                        ),
                        Flexible(
                            child: Text(
                          product.quantity.toString(),
                          style: StyleConstants.textStyle17,
                        )),
                        Flexible(
                          child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.green),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                cartProvider.incrementItemToCartProvider(index);
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
