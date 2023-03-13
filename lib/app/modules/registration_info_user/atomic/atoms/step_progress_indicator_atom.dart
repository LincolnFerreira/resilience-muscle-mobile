import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../ui/colors.dart';
import '../../../../core/atom_default/text_atom.dart';

class StepProgressIndicatorAtom extends StatelessWidget {
  final int currentStep;
  const StepProgressIndicatorAtom({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextAtom(
            text: 'Informações básicas', textColor: null, fontSize: 22),
        const SizedBox(
          height: 30,
        ),
        StepProgressIndicator(
          selectedColor: ColorsUI.second,
          totalSteps: 6,
          currentStep: currentStep,
        ),
      ],
    );
  }
}
