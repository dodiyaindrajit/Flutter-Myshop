import 'package:flutter/material.dart';
class CatalogModel {
  final List<Item> dummyProductList = [
    const Item(
        11,
        "Straight Kurta",
        "INDO ERA Women's Pure Cotton Solid Straight Kurta Palazzo With Dupatta Set",
        [
          "https://m.media-amazon.com/images/I/617fpstijES._UY741_.jpg",
          "https://m.media-amazon.com/images/I/61Dc90+QLXL._UY741_.jpg",
          "https://m.media-amazon.com/images/I/61QILdJ217L._UY741_.jpg",
          "https://m.media-amazon.com/images/I/71y8EfRGVSL._UX679_.jpg",
          "https://m.media-amazon.com/images/I/81kEyfzGygL._UY741_.jpg",
        ],
        684),
    const Item(
        12,
        "Base Shoes",
        "Adidas Unisex-Adult Grand Court Base Shoes",
        [
          "https://m.media-amazon.com/images/I/615fRm9NIEL._UX575_.jpg",
          "https://m.media-amazon.com/images/I/61oa5JtdVyL._UY695_.jpg",
          "https://m.media-amazon.com/images/I/61oa5JtdVyL._UY695_.jpg",
          "https://m.media-amazon.com/images/I/61oa5JtdVyL._UY695_.jpg",
          "https://m.media-amazon.com/images/I/616KEvX9b6L._UX575_.jpg",
        ],
        3684),
    const Item(
        13,
        "boAt Smartwatch",
        "boAt Wave Lite Smartwatch with 1.69 Inches HD Display, Heart Rate & SpO2 Level Monitor, Multiple Watch Faces, Activity Tracker, Multiple Sports Modes & IP68(Active Black), One Size",
        [
          "https://m.media-amazon.com/images/I/61+4BA2lt8L._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61+4BA2lt8L._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61z1QYbPl6L._SX679_.jpg",
          "https://m.media-amazon.com/images/I/71fU8utOzuL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/71twMWLcCZL._SX679_.jpg",
        ],
        3200),
    const Item(
        14,
        "Backpack",
        "Gear Polyester 46 cms 24 Litre Grey-Black-yellow(LBPECONO10412) Backpack",
        [
          "https://m.media-amazon.com/images/I/91QTZkurCuL._UY741_.jpg",
          "https://m.media-amazon.com/images/I/91FnhrHnsgL._UX679_.jpg",
          "https://m.media-amazon.com/images/I/81XMdy27ruL._UY741_.jpg",
          "https://m.media-amazon.com/images/I/81mA4-wrBGL._UY741_.jpg",
          "https://m.media-amazon.com/images/I/91Hw0HNOUxL._UX679_.jpg",
        ],
        799),
    const Item(
        15,
        "Wireless Headphones",
        "pTron Tangent Evo with 14Hrs Playback, Bluetooth 5.0 Wireless Headphones with Deep Bass, IPX4 Water Resistance, Ergonomic & Snug-fit, Voice Assistance, Magnetic Earbuds & Built-in HD Mic (Blue)",
        [
          "https://m.media-amazon.com/images/I/51zLZReyZVL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61WsxD2cvjL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61i9rlpn1HL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61zjTaZWRxL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/61oPLmfLpZL._SX679_.jpg",
        ],
        1299),
    const Item(
        16,
        "Hard Drive",
        "Seagate Expansion 2TB External HDD - 6.35 cm (2.5 Inch) USB 3.0 for Windows and Mac with 3 yr Data Recovery Services, Portable Hard Drive (STKM2000400)",
        [
          "https://m.media-amazon.com/images/I/81pAOJFcsFS._SX679_.jpg",
          "https://m.media-amazon.com/images/I/71l3Sg0pxOL._SX679_.jpg",
          "https://m.media-amazon.com/images/I/81hh9LOgT2L._SX679_.jpg",
          "https://m.media-amazon.com/images/I/81TNgX5KgOS._SX679_.jpg",
          "https://m.media-amazon.com/images/I/81HGWAgt5JS._SX679_.jpg",
        ],
        5499),
  ];

  // Get item by [id].
  // In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => dummyProductList.firstWhere((element) => element.id == id);

  // Get item by its position in the catalog.
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
