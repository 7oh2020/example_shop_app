import 'package:flutter/material.dart';

class SelectQuantityView extends StatelessWidget {
  SelectQuantityView({
    Key key,
    @required this.quantity,
    @required this.onChanged,
  }) : super(key: key);
  final Function(int) onChanged;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("数量を選択："),
        DropdownButton<int>(
          value: quantity,
          onChanged: onChanged,
          items: [
            DropdownMenuItem<int>(
              value: 1,
              child: Text("1個"),
            ),
            DropdownMenuItem<int>(
              value: 5,
              child: Text("5個"),
            ),
            DropdownMenuItem<int>(
              value: 10,
              child: Text("10個"),
            ),
            DropdownMenuItem<int>(
              value: 20,
              child: Text("20個"),
            ),
          ],
        ),
      ],
    );
  }
}
