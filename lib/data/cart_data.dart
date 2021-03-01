import 'package:example_shop/data/item_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// カートプロバイダー
final cartProvider = ChangeNotifierProvider<CartModel>(
  (_) => CartModel([]),
);

/// カートモデル
class CartModel extends ChangeNotifier {
  CartModel(this.items);
  final List<CartData> items;

  /// カートに追加
  void add(CartData item) {
    items.add(item);
    notifyListeners();
  }

  /// カートから削除
  void remove(CartData item) {
    items.remove(item);
    notifyListeners();
  }

  /// カートをクリア
  void clear() {
    items.clear();
    notifyListeners();
  }

  /// カートの合計金額を取得
  int sum() {
    int value = 0;
    for (final data in items) {
      value += data.item.price * data.quantity;
    }
    return value;
  }
}

/// カートのデータ
class CartData {
  CartData({
    @required this.item,
    @required this.color,
    @required this.quantity,
  });
  final ItemData item;
  final String color;
  final int quantity;
}
