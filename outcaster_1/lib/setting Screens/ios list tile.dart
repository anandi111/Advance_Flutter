import 'package:flutter/material.dart';

class CupertinoListTile extends StatefulWidget {
  CupertinoListTile(
      {Key? key,
      required this.title,
      required this.leading,
      required this.trailing})
      : super(key: key);
  Widget title = Text("");
  Widget leading = Text("");
  Widget trailing = Text("");

  @override
  State<CupertinoListTile> createState() => _CupertinoListTileState();
}

class _CupertinoListTileState extends State<CupertinoListTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListTile(
      title: widget.title,
      leading: widget.leading,
      trailing: widget.trailing,
    ));
  }
}
