import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
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
      child: CachedNetworkImage(
        imageUrl: avatar,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
