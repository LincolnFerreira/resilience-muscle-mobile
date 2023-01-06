import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/presentation/modules/home_user/home_user_module.dart';

void main() {
  setUpAll(() {
    initModule(HomeUserModule());
  });
}
