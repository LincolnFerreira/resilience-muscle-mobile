import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/bottom_navigation_bar_organism.dart';

class PerformanceTemplate extends StatelessWidget {
  final BottomNavigationBarOrganism bottomNavigationBarOrganism;
  const PerformanceTemplate({
    super.key,
    required this.bottomNavigationBarOrganism,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: bottomNavigationBarOrganism,
    );
  }
}
