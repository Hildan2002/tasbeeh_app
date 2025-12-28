import 'package:flutter/material.dart';
import 'package:tasbeeh_app/app.dart';
import 'package:tasbeeh_app/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InjectionContainer.init();
  runApp(TasbeehApp());
}
