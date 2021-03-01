import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アカウントプロバイダーの定義。
/// すべて架空の人物です。
final accountProvider = ChangeNotifierProvider<AccountModel>(
  (_) => AccountModel([
    Account(
      id: "ichi.t@example.com",
      name: "田中 一郎",
      prefectures: "東京都",
      gender: "Man",
      age: 20,
    ),
    Account(
      id: "suzuki22@example.com",
      name: "鈴木 二郎",
      prefectures: "東京都",
      gender: "Man",
      age: 31,
    ),
    Account(
      id: "yama3@example.com",
      name: "山田 三子",
      prefectures: "大阪府",
      gender: "Female",
      age: 32,
    ),
    Account(
      id: "siro.t@example.com",
      name: "高橋 四郎",
      prefectures: "大阪府",
      gender: "Female",
      age: 24,
    ),
    Account(
      id: "go.sato@example.com",
      name: "佐藤 五郎",
      prefectures: "福岡県",
      gender: "Other",
      age: 26,
    ),
  ]),
);

/// アカウントのモデル
class AccountModel extends ChangeNotifier {
  AccountModel(this.accounts);
  final List<Account> accounts;
  Account _currentAccount;
  bool _isShowAuthPage = true;

  Account get currentAccount => _currentAccount ?? accounts[0];
  bool get isShowAuthPage => _isShowAuthPage;

  /// アカウントを選択
  void select(Account account) {
    _currentAccount = account;
    notifyListeners();
  }

  /// サインイン
  void signIn() {
    print("ログイン： ${currentAccount.name}");
    _isShowAuthPage = false;
    notifyListeners();
  }

  /// 認証ページの表示・非表示
  void setShowAuthPage(bool value) {
    _isShowAuthPage = value;
    notifyListeners();
  }
}

/// アカウントデータ
class Account {
  Account({
    @required this.id,
    @required this.name,
    @required this.prefectures,
    this.gender,
    this.age,
  });
  final String id;
  final String name;
  final String prefectures;
  final String gender;
  final int age;
}
