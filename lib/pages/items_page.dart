import 'package:example_shop/data/account_data.dart';
import 'package:example_shop/pages/cart_page.dart';
import 'package:example_shop/pages/wishlist_page.dart';
import 'package:example_shop/views/items_view.dart';
import 'package:example_shop/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsPage extends StatelessWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      return Scaffold(
        appBar: AppBar(
          title: Text("商品を見つける"),
          actions: [
            IconButton(
              tooltip: "ウィッシュリスト",
              icon: Icon(Icons.shop),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => WishListPage(),
                  ),
                );
              },
            ),
            IconButton(
              tooltip: "アカウント切り替え",
              icon: Icon(Icons.account_circle),
              onPressed: () =>
                  context.read(accountProvider).setShowAuthPage(true),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchView(),
              ItemsView(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          child: Icon(Icons.shopping_cart),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CartPage(),
              ),
            );
          },
        ),
      );
    });
  }
}
