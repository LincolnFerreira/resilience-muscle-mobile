import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app_module.dart';

import 'app_initializer.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
