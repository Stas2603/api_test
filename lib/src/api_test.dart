import 'package:flutter/material.dart';

class DayManager extends StatelessWidget {
  const DayManager({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}
