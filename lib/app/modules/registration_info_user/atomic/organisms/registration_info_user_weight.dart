import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import '../../../../../ui/colors.dart';

import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserWeight extends StatefulWidget {
  final VoidCallback? onPressed;

  const RegistrationInfoUserWeight({
    super.key,
    this.onPressed,
  });

  @override
  State<RegistrationInfoUserWeight> createState() =>
      _RegistrationInfoUserWeightState();
}

double _currentKilos = 20;

class _RegistrationInfoUserWeightState
    extends State<RegistrationInfoUserWeight> {
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
                text: 'Qual seu peso?',
                textColor: ColorsUI.dark,
                fontSize: 22,
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
              HorizontalPicker(
                minValue: 60,
                maxValue: 238,
                divisions: 170,
                height: 100,
                suffix: " cm",
                initialPosition: InitialPosition.center,
                showCursor: false,
                backgroundColor: Colors.white,
                activeItemTextColor: ColorsUI.primary,
                passiveItemsTextColor: ColorsUI.dark,
                onChanged: (value) {
                  setState(() {
                    _currentKilos = value;
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
