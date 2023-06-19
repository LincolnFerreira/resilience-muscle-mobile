import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/attendance/presentation/atomic/pages/attendance_page.dart';

class AttendanceModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];
  List<Bind> _getRepositoryBinds() {
    return [];
  }

  List<Bind> _getUseCaseBinds() {
    return [];
  }

  List<Bind> _getCubitBinds() {
    return [];
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AttendancePage()),
  ];
}
