import 'package:example_shop/data/account_data.dart';
import 'package:example_shop/data/cart_data.dart';
import 'package:example_shop/pages/complete_page.dart';
import 'package:example_shop/views/select_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPayment = "Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お支払い手続き"),
      ),
      body: Consumer(builder: (_, watch, __) {
        final cartModel = watch(cartProvider);
        final accountModel = watch(accountProvider);
        final sumPrice = cartModel.sum();
        final deliveryFee = 1000;
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("小計：$sumPrice円"),
              Text("送料：$deliveryFee円"),
              Container(
                color: Colors.white70,
                width: 200.0,
                height: 1.5,
              ),
              Text(
                "合計：${sumPrice + deliveryFee}円",
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("お届け先："),
              Text("${accountModel.currentAccount.prefectures} XXX 1-2-3"),
              SizedBox(
                height: 30.0,
              ),
              SelectPaymentView(
                payment: _selectedPayment,
                onChanged: (String value) {
                  setState(() => _selectedPayment = value);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.red,
                child: Text("注文を確定する"),
                onPressed: () async {
                  context.read(cartProvider).clear();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CompletePage(),
                  ));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
