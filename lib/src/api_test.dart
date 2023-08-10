import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import 'presentation/screens/details_screen/details_screen_view.dart';
import 'presentation/screens/main_screen/main_screen_view.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const MainScreenView()),
          GetPage(name: '/details', page: () => const DetailsScreenView()),
        ],
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
