import 'package:example_shop/data/account_data.dart';
import 'package:example_shop/pages/auth_page.dart';
import 'package:example_shop/pages/items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (_, watch, __) {
        final accountModel = watch(accountProvider);
        return SafeArea(
          child: accountModel.isShowAuthPage ? AuthPage() : ItemsPage(),
        );
      }),
    );
  }
}
