import 'package:flutter/foundation.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/model/cart_response_wrapper.dart';
import 'package:myshop/models/cart/catelog.dart';

class CartProvider extends ChangeNotifier {
  var flutterCart = FlutterCart();
  late CartResponseWrapper cartResponseWrapper;

  addToCart(Item productElement, {int funcQuantity = 0}) async {
    cartResponseWrapper = flutterCart.addToCart(
        productId: productElement.id,
        unitPrice: productElement.price,
        productName: productElement.name,
        quantity: funcQuantity == 0 ? 1 : funcQuantity,
        productDetailsObject: productElement);
    notifyListeners();
  }

  bool cartIsEmpty() {
    return flutterCart.cartItem.isEmpty;
  }

  deleteItemFromCart(int index) async {
    cartResponseWrapper = flutterCart.deleteItemFromCart(index);
    notifyListeners();
  }

  decrementItemFromCartProvider(int index) async {
    cartResponseWrapper = flutterCart.decrementItemFromCart(index);
    notifyListeners();
  }

  incrementItemToCartProvider(int index) async {
    cartResponseWrapper = flutterCart.incrementItemToCart(index);
    notifyListeners();
  }

  int? findItemIndexFromCartProvider(cartId) {
    int? index = flutterCart.findItemIndexFromCart(cartId);
    return index;
  }

  //show already added items with their quantity on servicelistdetail screen
  CartItem? getSpecificItemFromCartProvider(id) {
    CartItem? cartItem = flutterCart.getSpecificItemFromCart(id);

    if (cartItem != null) {
      if (kDebugMode) {
        print("Name ${cartItem.productDetails.name} Quantity ${cartItem.quantity}");
      }
      return cartItem;
    }
    return cartItem;
  }

  double getTotalAmount() {
    return flutterCart.getTotalAmount();
  }

  List<CartItem> getCartItems() {
    return flutterCart.cartItem;
  }

  printCartValue() {
    for (var f in flutterCart.cartItem) {
      {
        if (kDebugMode) {
          print(f.productId);
          print(f.quantity);
        }
      }
    }
  }

  deleteAllCartProvider() {
    flutterCart.deleteAllCart();
  }
}
