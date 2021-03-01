import 'package:flutter/material.dart';

class SelectPaymentView extends StatelessWidget {
  SelectPaymentView({
    Key key,
    @required this.payment,
    @required this.onChanged,
  }) : super(key: key);
  final String payment;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("お支払い方法を選択："),
        DropdownButton<String>(
          value: payment,
          onChanged: onChanged,
          items: [
            DropdownMenuItem<String>(
              value: "Card",
              child: Text("クレジットカード"),
            ),
            DropdownMenuItem<String>(
              value: "Bank",
              child: Text("銀行振込"),
            ),
            DropdownMenuItem<String>(
              value: "Coupon",
              child: Text("クーポン"),
            ),
            DropdownMenuItem<String>(
              value: "Coin",
              child: Text("仮想通貨"),
            ),
          ],
        ),
      ],
    );
  }
}
