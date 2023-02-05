import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

import '../../../../../core/atom_default/space_widget_atom.dart';

class RegistrationInfoUserWeight extends StatefulWidget {
  const RegistrationInfoUserWeight({super.key});

  @override
  State<RegistrationInfoUserWeight> createState() =>
      _RegistrationInfoUserWeightState();
}

double _currentKilos = 0;

class _RegistrationInfoUserWeightState
    extends State<RegistrationInfoUserWeight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: TextAtom(
            text: 'Qual seu peso atual?',
            textColor: Pallete.dark,
            fontSize: 22,
          ),
        ),
        const SpaceWidgetAtom(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextAtom(
              text: '$_currentKilos Kg',
              fontSize: 30,
            ),
          ],
        ),
        const SpaceWidgetAtom(height: 20),
        HorizontalPicker(
          minValue: 60,
          maxValue: 238,
          divisions: 1700,
          height: 100,
          suffix: " Kg",
          initialPosition: InitialPosition.center,
          showCursor: false,
          backgroundColor: Colors.white,
          activeItemTextColor: Pallete.primary,
          passiveItemsTextColor: Pallete.dark,
          onChanged: (value) {
            setState(() {
              _currentKilos = value;
            });
          },
        ),
      ],
    );
  }
}
