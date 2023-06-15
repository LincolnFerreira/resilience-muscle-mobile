import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/modules/login/domain/entities/user_entity.dart';
import 'app/modules/login/domain/entities/user_info_entity.dart';
import 'firebase_options.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeHive();
    await _initializeFirebase();
  }

  static Future<void> _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserEntityAdapter());
    await Hive.openBox<UserEntity>(HiveBoxes.userBox);
    await Hive.openBox<UserInfoEntity>(HiveBoxes.infoUserBox);
  }

  static Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

class HiveBoxes {
  static const String userBox = 'user';
  static const String infoUserBox = 'infoUser';
}
