import 'package:flutter/material.dart';

class SelectColorView extends StatelessWidget {
  SelectColorView({
    Key key,
    @required this.color,
    @required this.onChanged,
  }) : super(key: key);
  final Function(String) onChanged;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("カラーを選択："),
        DropdownButton<String>(
          value: color,
          onChanged: onChanged,
          items: [
            DropdownMenuItem<String>(
              value: "Red",
              child: Text("Red"),
            ),
            DropdownMenuItem<String>(
              value: "Yellow",
              child: Text("Yellow"),
            ),
            DropdownMenuItem<String>(
              value: "White",
              child: Text("White"),
            ),
            DropdownMenuItem<String>(
              value: "Black",
              child: Text("Black"),
            ),
          ],
        ),
      ],
    );
  }
}
