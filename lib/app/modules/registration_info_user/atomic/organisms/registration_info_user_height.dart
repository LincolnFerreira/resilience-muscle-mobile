// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserHeight extends StatefulWidget {
  final VoidCallback? onPressed;
  const RegistrationInfoUserHeight({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RegistrationInfoUserHeight> createState() =>
      _RegistrationInfoUserHeightState();
}

double _currentCentimeters = 149;

class _RegistrationInfoUserHeightState
    extends State<RegistrationInfoUserHeight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SpaceWidgetAtom(height: 40),
          Column(
            children: [
              const TextAtom(
                text: 'Qual sua altura?',
                textColor: Pallete.dark,
                fontSize: 22,
              ),
              const SpaceWidgetAtom(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextAtom(
                    text: '$_currentCentimeters Cm',
                    fontSize: 30,
                  ),
                ],
              ),
              HorizontalPicker(
                minValue: 60,
                maxValue: 238,
                divisions: 170,
                height: 100,
                suffix: " cm",
                initialPosition: InitialPosition.center,
                showCursor: false,
                backgroundColor: Colors.white,
                activeItemTextColor: Pallete.primary,
                passiveItemsTextColor: Pallete.dark,
                onChanged: (value) {
                  setState(() {
                    _currentCentimeters = value;
                  });
                },
              ),
            ],
          ),
          const SpaceWidgetAtom(height: 54),
          ButtonOrganism.primary(
            textButton: 'Confirmar',
            onPressed: widget.onPressed!,
            width: 232,
          )
        ],
      ),
    );
  }
}
