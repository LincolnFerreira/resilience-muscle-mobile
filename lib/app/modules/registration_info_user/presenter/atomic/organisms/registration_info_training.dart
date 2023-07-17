import 'package:flutter/material.dart';
import 'package:resilience_muscle/ui/box_text.dart';

class RegistrationInfoTraining extends StatefulWidget {
  const RegistrationInfoTraining({super.key});

  @override
  State<RegistrationInfoTraining> createState() =>
      _RegistrationInfoTrainingState();
}

List<bool> _selections = [false, false, false];

class _RegistrationInfoTrainingState extends State<RegistrationInfoTraining> {
  void _onPressed(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < _selections.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          _selections[buttonIndex] = true;
        } else {
          _selections[buttonIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ToggleButtons(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        isSelected: _selections,
        onPressed: _onPressed,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoxText.caption('Grupos musculares'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoxText.caption('Partes do corpo'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoxText.caption('Movimentos'),
          ),
          ToggleButtons(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            isSelected: _selections,
            onPressed: _onPressed,
            children: const [],
          ),
        ],
      )
    ]);
  }
}
