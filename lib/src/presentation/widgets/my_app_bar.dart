import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.icon,
  }) : preferredSize = const Size.fromHeight(60.0);

  final String title;
  final Icon? icon;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        leading: icon,
        title: Text(title),
      );
}
