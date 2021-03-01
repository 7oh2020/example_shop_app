import 'package:example_shop/data/account_data.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  AccountView({
    Key key,
    this.account,
  }) : super(key: key);
  final Account account;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.account_circle,
            size: 28.0,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(account.name),
            Text(
              account.id,
              style: TextStyle(color: Colors.white60),
            ),
          ],
        ),
      ],
    );
  }
}
