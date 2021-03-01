import 'package:example_shop/data/cart_data.dart';
import 'package:flutter/material.dart';

class CartListTile extends StatelessWidget {
  CartListTile({
    Key key,
    @required this.data,
    @required this.onPressed,
  }) : super(key: key);
  final CartData data;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.item.name),
      subtitle: Text("${data.color} / ${data.quantity}個 / ${data.item.price}円"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onPressed,
      ),
    );
  }
}
