import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:myshop/models/cart/catelog.dart';
import 'package:myshop/providers/cart_provider.dart';
import 'package:myshop/screens/order/cash_on_delivery.dart';
import 'package:myshop/screens/order/razor_pay_button.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select a Payment Options",
                style: StyleConstants.textStyle19.copyWith(fontSize: 20.sp),
              ),
              WidgetConst.heightSpacer(10),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Information",
                        style: StyleConstants.textStyle19,
                      ),
                      WidgetConst.heightSpacer(5),
                      Consumer<CartProvider>(
                          builder: (context, cart, child) => SizedBox(
                              height: (cart.getCartItems().length * 9.h), child: _OrderList())),
                      const Divider(height: 2, thickness: 2, color: Colors.black),
                      //Cart Total
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total', style: TextStyle(color: Colors.grey, fontSize: 24)),
                            Consumer<CartProvider>(
                                builder: (context, cart, child) => Text(
                                    '₹${cart.getTotalAmount().toString()}',
                                    style: StyleConstants.textStyle19))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              WidgetConst.heightSpacer(10),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<CartProvider>(
                    builder: (context, cart, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Mode",
                          style: StyleConstants.textStyle19,
                        ),
                        WidgetConst.heightSpacer(5),
                        RazorPayButton(totalAmount: cart.getTotalAmount()),
                        CashOnDeliveryButton(totalAmount: cart.getTotalAmount()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderList extends StatefulWidget {
  @override
  State<_OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<_OrderList> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = context.watch<CartProvider>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cartProvider.flutterCart.cartItem.length,
      itemBuilder: (_, index) {
        CartItem product = cartProvider.flutterCart.cartItem[index];
        Item item = product.productDetails as Item;
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          leading: CachedNetworkImage(imageUrl: item.imageUrl.first, height: 60, width: 50),
          title:
              Text(product.productName ?? "Title", style: StyleConstants.textStyle19, maxLines: 1),
          subtitle: Text(item.details, style: const TextStyle(fontSize: 16.0), maxLines: 2),
          trailing: Text("₹ ${item.price.toString()} x ${product.quantity}",
              style: StyleConstants.textStyle17),
        );
      },
    );
  }
}
