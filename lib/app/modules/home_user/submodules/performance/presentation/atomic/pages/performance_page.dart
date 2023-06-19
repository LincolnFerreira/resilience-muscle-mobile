import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/performance/presentation/atomic/templates/performance_template.dart';

import '../../../../../atomic/organisms/bottom_navigation_bar_organism.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    return const PerformanceTemplate(
      bottomNavigationBarOrganism: BottomNavigationBarOrganism(
        currentPage: PageName.performance,
      ),
    );
  }
}
