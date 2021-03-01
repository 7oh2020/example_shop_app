import 'package:example_shop/atoms/item_list.dart';
import 'package:example_shop/data/item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsView extends StatelessWidget {
  ItemsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(builder: (_, watch, __) {
      final itemsModel = watch(itemProvider);
      final items = itemsModel.items;
      return Container(
        height: size.height * 0.7,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, i) => ItemListTile(item: items[i]),
        ),
      );
    });
  }
}
