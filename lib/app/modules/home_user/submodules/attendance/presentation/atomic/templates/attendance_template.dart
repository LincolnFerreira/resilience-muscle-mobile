import 'package:flutter/material.dart';

import '../../../../../atomic/organisms/bottom_navigation_bar_organism.dart';

class AttendanceTemplate extends StatelessWidget {
  const AttendanceTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavigationBarOrganism(
        currentPage: PageName.attendance,
      ),
    );
  }
}
