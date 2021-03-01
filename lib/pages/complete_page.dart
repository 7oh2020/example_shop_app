import 'package:flutter/material.dart';

class CompletePage extends StatelessWidget {
  CompletePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注文完了"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ご注文ありがとうございました！",
              style: TextStyle(fontSize: 24.0),
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Homeへもどる"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
