import 'package:flutter/material.dart';
import 'package:tasbeeh_app/features/home/presentation/pages/home_page.dart';

class TasbeehApp extends StatelessWidget {
  const TasbeehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tasbeeh App', home: HomePages());
  }
}
