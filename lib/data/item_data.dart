import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アイテムプロバイダー
final itemProvider = ChangeNotifierProvider<ItemModel>(
  (_) => ItemModel([
    ItemData(
      id: "CB-C-001",
      name: "Cool・キャップ",
      price: 1000,
      category: "キャップ",
      brand: "Cool Brand",
    ),
    ItemData(
      id: "CB-S-501",
      name: "Cool・シューズ",
      price: 2400,
      category: "シューズ",
      brand: "Cool Brand",
    ),
    ItemData(
      id: "CB-J-808",
      name: "Cool・ジャケット",
      price: 12000,
      category: "ジャケット",
      brand: "Cool Brand",
    ),
    ItemData(
      id: "NB-C-120",
      name: "New・キャップ",
      price: 2200,
      category: "キャップ",
      brand: "New Brand",
    ),
    ItemData(
      id: "NB-S-333",
      name: "New・シューズ",
      price: 5600,
      category: "シューズ",
      brand: "New Brand",
    ),
    ItemData(
      id: "NB-J-909",
      name: "New・ジャケット",
      price: 32000,
      category: "ジャケット",
      brand: "New Brand",
    ),
    ItemData(
      id: "SB-C-101",
      name: "Simple Cap 1",
      price: 2400,
      category: "キャップ",
      brand: "Simple Brand",
    ),
    ItemData(
      id: "SB-C-102",
      name: "Simple Cap 2",
      price: 2400,
      category: "キャップ",
      brand: "Simple Brand",
    ),
    ItemData(
      id: "SB-C-103",
      name: "Simple Cap 3",
      price: 2400,
      category: "キャップ",
      brand: "Simple Brand",
    ),
  ]),
);

/// アイテムのモデル
class ItemModel extends ChangeNotifier {
  ItemModel(this.items);
  final List<ItemData> items;
}

/// アイテムのデータ
class ItemData {
  ItemData({
    @required this.id,
    @required this.name,
    @required this.price,
    this.category,
    this.brand,
  });
  final String id;
  final String name;
  final int price;
  final String category;
  final String brand;
}
