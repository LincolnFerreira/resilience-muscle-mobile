import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:resilience_muscle/app_module.dart';
import 'package:resilience_muscle/firebase_options.dart';

import 'app/modules/login/domain/entities/user_entity.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
