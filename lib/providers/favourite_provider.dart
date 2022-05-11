import 'package:flutter/foundation.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/model/cart_response_wrapper.dart';
import 'package:myshop/models/catelog.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Item> favouriteList = [];
  late CartResponseWrapper favouriteResponseWrapper;

  addToFavourite(Item _productElement, {int funcQuantity = 0}) async {
    favouriteList.add(_productElement);
    notifyListeners();
  }

  deleteItemFromFavourite(int index) async {
    favouriteList.removeAt(index);
    notifyListeners();
  }

  deleteItemFromFavouriteByItem(Item item) async {
    favouriteList.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  bool cartIsEmpty() {
    return favouriteList.isEmpty;
  }
  
  List<Item> getCartItems() {
    print(favouriteList);
    return favouriteList;
  }

  Item? getSpecificItemFromCartProvider(id) {
    for (int i = 0; i < favouriteList.length; i++) {
      if (favouriteList[i].id == id) {
        return favouriteList[i];
      }
    }
    return null;
  }

  deleteAllCartProvider() {
    favouriteList.clear();
    notifyListeners();
  }
}
