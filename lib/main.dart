import 'package:flutter/material.dart';

import 'src/api_test.dart';
import 'src/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const ApiTest());
}
