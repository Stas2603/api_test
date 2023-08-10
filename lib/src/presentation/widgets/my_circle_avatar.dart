import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({
    super.key,
    required this.padding,
    required this.radius,
    required this.avatar,
  });

  final double padding;
  final double radius;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatar),
      ),
    );
  }
}
