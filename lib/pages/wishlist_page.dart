import 'package:example_shop/atoms/item_list.dart';
import 'package:example_shop/data/wishlist_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListPage extends StatelessWidget {
  WishListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ウィッシュリスト"),
      ),
      body: Consumer(builder: (_, watch, __) {
        final wishListModel = watch(wishListProvider);
        return wishListModel.items.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: wishListModel.items.length,
                itemBuilder: (context, i) => ItemListTile(
                  item: wishListModel.items[i],
                  handleDelete: () {
                    context
                        .read(wishListProvider)
                        .remove(wishListModel.items[i]);
                  },
                ),
              )
            : Center(
                child: Text("アイテムがありません"),
              );
      }),
    );
  }
}
