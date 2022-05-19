import 'package:flutter/foundation.dart';
import 'package:flutter_cart/model/cart_response_wrapper.dart';
import 'package:myshop/models/cart/catelog.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Item> favouriteList = [];
  late CartResponseWrapper favouriteResponseWrapper;

  addToFavourite(Item productElement, {int funcQuantity = 0}) async {
    favouriteList.add(productElement);
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
