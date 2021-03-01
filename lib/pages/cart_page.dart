import 'package:example_shop/atoms/cart_list.dart';
import 'package:example_shop/data/cart_data.dart';
import 'package:example_shop/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(builder: (_, watch, __) {
      final cartModel = watch(cartProvider);
      return Scaffold(
        appBar: AppBar(
          title: Text("カートの確認"),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            Container(
              height: size.height * 0.7,
              child: cartModel.items.length > 0
                  ? ListView.builder(
                      // shrinkWrap: true,
                      itemCount: cartModel.items.length,
                      itemBuilder: (context, i) => CartListTile(
                        data: cartModel.items[i],
                        onPressed: () {
                          context.read(cartProvider).remove(cartModel.items[i]);
                        },
                      ),
                    )
                  : Center(
                      child: Text("アイテムがありません"),
                    ),
            ),
            Container(
              color: Colors.white70,
              height: 1.5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("小計：${cartModel.sum()}円　"),
                  RaisedButton(
                    color: Colors.red,
                    child: Text("決済進む"),
                    onPressed: cartModel.items.length > 0
                        ? () async {
                            Navigator.of(context).pop();
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PaymentPage(),
                            ));
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
