import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh_app/injection_container.dart';

class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tasbeeh App',
      routerConfig: getIt<GoRouter>(),
    );
  }
}
