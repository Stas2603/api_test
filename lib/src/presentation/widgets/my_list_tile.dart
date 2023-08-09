import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entity/user.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.push('details', extra: user.id);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 9),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ListTile(
            trailing: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photo),
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
          ),
        ),
      ),
    );
  }
}
