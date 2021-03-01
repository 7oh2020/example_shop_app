import 'package:example_shop/data/cart_data.dart';
import 'package:example_shop/data/item_data.dart';
import 'package:example_shop/data/wishlist_data.dart';
import 'package:example_shop/views/select_color_view.dart';
import 'package:example_shop/views/select_quantity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.item}) : super(key: key);
  final ItemData item;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _selectedColor = "Red";
  int _selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品の詳細"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.item.name,
              style: TextStyle(fontSize: 28.0),
            ),
            Text(
              "カテゴリ：${widget.item.category} ",
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              "ブランド：${widget.item.brand}",
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              "商品番号：${widget.item.id}",
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              "価格：${widget.item.price}円",
              style: TextStyle(
                color: Colors.orange[700],
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SelectColorView(
              color: _selectedColor,
              onChanged: (String value) {
                setState(() => _selectedColor = value);
              },
            ),
            SelectQuantityView(
              quantity: _selectedQuantity,
              onChanged: (int value) {
                setState(() => _selectedQuantity = value);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer(builder: (_, watch, __) {
              return Row(children: [
                Expanded(
                  child: RaisedButton(
                    color: Colors.red[700],
                    child: Text("カートに追加"),
                    onPressed: () {
                      final data = CartData(
                        item: widget.item,
                        color: _selectedColor,
                        quantity: _selectedQuantity,
                      );
                      context.read(cartProvider).add(data);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ]);
            }),
            Row(children: [
              Expanded(
                child: RaisedButton(
                  color: Colors.white24,
                  child: Text("ウィッシュリストに追加"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read(wishListProvider).add(widget.item);
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
