import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/atomic/pages/attendance_page.dart';

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
