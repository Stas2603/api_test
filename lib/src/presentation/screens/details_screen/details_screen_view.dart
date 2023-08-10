import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/my_circle_avatar.dart';
import 'detalis_screen_controller.dart';

const textStyle = TextStyle(
  fontSize: 15.0,
);
const double _padding = 8.0;
const double _radius = 100.0;
const double _tableBorderWidth = 1.5;
const Color _tableBorderColor = Colors.black;

class DetailsScreenView extends GetView<DetailsScreenController> {
  const DetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => MyAppBar(
        title: S.of(context).detailsScreen,
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  Widget _buildBody(BuildContext context) {
    return Obx(() {
      final user = controller.user;
      final id = user.value.id;
      final email = user.value.email;
      final firstName = user.value.firstName;
      final lastName = user.value.lastName;
      final photo = user.value.photo;

      return Column(
        children: [
          UserPhoto(padding: _padding, radius: _radius, avatar: photo),
          _buildTable(context, id, email, firstName, lastName),
        ],
      );
    });
  }

  Widget _buildTable(
    BuildContext context,
    int id,
    String email,
    String firstName,
    String lastName,
  ) =>
      Padding(
        padding: const EdgeInsets.all(_padding),
        child: Table(
          border: TableBorder.all(
            color: _tableBorderColor,
            width: _tableBorderWidth,
          ),
          children: [
            _buildTableRow(S.of(context).id, id.toString()),
            _buildTableRow(S.of(context).email, email),
            _buildTableRow(S.of(context).firstName, firstName),
            _buildTableRow(S.of(context).lastName, lastName),
          ],
        ),
      );

  TableRow _buildTableRow(String title, String text) => TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(_padding),
          child: Text(
            title,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(_padding),
          child: Text(
            text,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]);
}
