import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  List itemInfo = [
    [
      11,
      "Nike",
      "Good Nike Shoes",
      ["https://pngimg.com/uploads/running_shoes/running_shoes_PNG5816.png"],
      1200
    ],
    [
      12,
      "Mobile",
      "Good One Plus Mobile",
      ["https://m.media-amazon.com/images/I/81zLNgcvlaL._SX679_.jpg"],
      2000
    ],
    [
      13,
      "Clocks",
      "Good Clock",
      ["https://pngimg.com/uploads/clock/small/clock_PNG6655.png"],
      4000
    ],
    [
      14,
      "TVDD",
      "Good Tv",
      ["https://pngimg.com/uploads/tv/small/tv_PNG39249.png"],
      14000
    ],
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) =>
      Item(itemInfo[id][0], itemInfo[id][1], itemInfo[id][2], itemInfo[id][3], itemInfo[id][4]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final String details;
  final List<String> imageUrl;
  final int price;

  const Item(this.id, this.name, this.details, this.imageUrl, this.price);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
