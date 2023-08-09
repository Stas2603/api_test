import 'package:flutter/material.dart';

import 'src/api_test.dart';
import 'src/di/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();

  runApp(const ApiTest());
}
