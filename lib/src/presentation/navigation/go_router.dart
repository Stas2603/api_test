import 'package:go_router/go_router.dart';

import '../screens/main_screen/main_screen_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreenView(),
    ),
  ],
);
