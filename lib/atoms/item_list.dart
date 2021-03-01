import 'package:example_shop/data/item_data.dart';
import 'package:example_shop/pages/detail_page.dart';
import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  ItemListTile({
    Key key,
    @required this.item,
    this.handleDelete,
  }) : super(key: key);
  final ItemData item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text("${item.brand} / ${item.price}円"),
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailPage(item: item),
        ));
      },
      trailing: handleDelete != null
          ? IconButton(
              icon: Icon(Icons.delete),
              onPressed: handleDelete,
            )
          : null,
    );
  }
}
