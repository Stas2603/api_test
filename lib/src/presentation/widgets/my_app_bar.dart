import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _sizeFromHeight = 60.0;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.icon,
  }) : preferredSize = const Size.fromHeight(_sizeFromHeight);

  final String title;
  final Icon? icon;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        leading: InkWell(
          child: icon,
          onTap: () => Get.toNamed('/'),
        ),
        title: Text(title),
      );
}
