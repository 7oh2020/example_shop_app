import 'package:example_shop/data/item_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ウィッシュリストのプロバイダー
final wishListProvider = ChangeNotifierProvider<WishListModel>(
  (_) => WishListModel([]),
);

/// ウィッシュリストのモデル
class WishListModel extends ChangeNotifier {
  WishListModel(this.items);
  final List<ItemData> items;

  /// アイテムの追加
  void add(ItemData item) {
    if (items.contains(item)) {
      return;
    }
    items.add(item);
    notifyListeners();
  }

  /// アイテムの削除
  void remove(ItemData item) {
    if (!items.contains(item)) {
      return;
    }
    items.remove(item);
    notifyListeners();
  }

  /// ウィッシュリストのクリア
  void clear() {
    items.clear();
    notifyListeners();
  }
}
