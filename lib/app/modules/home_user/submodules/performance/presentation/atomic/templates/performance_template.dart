import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/bottom_navigation_bar_organism.dart';

class PerformanceTemplate extends StatelessWidget {
  const PerformanceTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavigationBarOrganism(),
    );
  }
}
