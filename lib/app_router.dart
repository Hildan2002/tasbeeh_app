import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh_app/features/activity/presentation/pages/home_page.dart';

class AppRouter {
  static const String activity = '/';

  static final GoRouter routerConfig = GoRouter(
    initialLocation: activity,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: <GoRoute>[
      GoRoute(
        path: activity,
        builder: (context, state) => const ActivityPages(),
      ),
    ],
  );
}
