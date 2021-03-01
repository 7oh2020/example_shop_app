import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  SearchView({Key key, this.keyword}) : super(key: key);
  final String keyword;

  @override
  _SearchViewState createState() => _SearchViewState(keyword);
}

class _SearchViewState extends State<SearchView> {
  _SearchViewState(String keyword)
      : _keywordFocus = FocusNode(),
        _keywordText = TextEditingController(text: keyword);
  final TextEditingController _keywordText;
  final FocusNode _keywordFocus;
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search),
        Expanded(
            child: TextField(
          controller: _keywordText,
          focusNode: _keywordFocus,
          onSubmitted: (_) => _handleSubmit(),
          onTap: !_hasFocus ? () => setState(() => _hasFocus = true) : null,
          decoration: InputDecoration(
            hintText: "キーワードで検索",
          ),
        )),
        Visibility(
          visible: _hasFocus,
          child: FlatButton(
            child: Text("キャンセル"),
            onPressed: _handleSubmit,
          ),
        ),
      ],
    );
  }

  void _handleSubmit() {
    _keywordFocus.unfocus();
    _keywordText.clear();
    setState(() => _hasFocus = false);
  }
}
