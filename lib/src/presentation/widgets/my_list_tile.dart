import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entity/user.dart';
import 'my_circle_avatar.dart';

const double _listTilePadding = 8.0;
const Color _boxDecorationColor = Colors.white;
const Color _boxShadowColor = Colors.black;
const double _boxShadowOpacity = 0.2;
const double _boxShadowblurRadius = 20.0;
const double _boxShadowspreadRadius = 1.0;
const double _myCircleAvatarPadding = 0.0;
const double _myCircleAvatarRadius = 40.0;

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_listTilePadding),
      child: InkWell(
        onTap: () {
          Get.toNamed('/details', arguments: user.id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: _boxDecorationColor,
            boxShadow: [
              BoxShadow(
                color: _boxShadowColor.withOpacity(_boxShadowOpacity),
                blurRadius: _boxShadowblurRadius,
                spreadRadius: _boxShadowspreadRadius,
              ),
            ],
          ),
          child: ListTile(
            trailing: MyCircleAvatar(
              padding: _myCircleAvatarPadding,
              radius: _myCircleAvatarRadius,
              avatar: user.photo,
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
          ),
        ),
      ),
    );
  }
}
