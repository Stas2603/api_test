import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/my_list_tile.dart';
import 'main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildUserList(context),
      );

  PreferredSizeWidget _buildAppBar(BuildContext context) => MyAppBar(
        title: S.of(context).mainScreen,
        icon: null,
      );

  Widget _buildUserList(BuildContext context) => Obx(() {
        if (controller.users.isEmpty) {
          return Center(
            child: Text(S.of(context).noUser),
          );
        } else if (controller.isLoading.isTrue) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];

              return MyListTile(user: user);
            },
          );
        }
      });
}
