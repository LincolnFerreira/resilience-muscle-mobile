import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgressIndicatorAtom extends StatelessWidget {
  const StepProgressIndicatorAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return const StepProgressIndicator(
      totalSteps: 10,
    );
  }
}
