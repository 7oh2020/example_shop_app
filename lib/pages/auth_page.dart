import 'package:example_shop/data/account_data.dart';
import 'package:example_shop/data/cart_data.dart';
import 'package:example_shop/data/wishlist_data.dart';
import 'package:example_shop/views/account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("サインイン"),
      ),
      body: Consumer(builder: (_, watch, __) {
        final accountModel = watch(accountProvider);
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("アカウントを選択"),
              DropdownButton<Account>(
                value: accountModel.currentAccount ?? accountModel.accounts[0],
                onChanged: (Account value) =>
                    context.read(accountProvider).select(value),
                items: accountModel.accounts.map<DropdownMenuItem<Account>>(
                  (account) {
                    return DropdownMenuItem<Account>(
                      value: account,
                      child: AccountView(account: account),
                    );
                  },
                ).toList(),
              ),
              RaisedButton(
                child: Text("サインイン"),
                onPressed: () {
                  context.read(accountProvider).signIn();
                  context.read(cartProvider).clear();
                  context.read(wishListProvider).clear();
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
