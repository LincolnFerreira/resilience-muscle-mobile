// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import '../../../../../ui/colors.dart';

import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserHorizontalPicker extends StatefulWidget {
  final VoidCallback? onPressed;
  final Function(double)? onChangeInputHeight;
  final double currentCentimeters;
  final String suffix;
  final String? textButton;
  const RegistrationInfoUserHorizontalPicker({
    Key? key,
    this.onPressed,
    this.onChangeInputHeight,
    this.textButton,
    required this.currentCentimeters,
    required this.suffix, // Parâmetro adicionado
  }) : super(key: key);

  @override
  State<RegistrationInfoUserHorizontalPicker> createState() =>
      _RegistrationInfoUserHorizontalPickerState();
}

class _RegistrationInfoUserHorizontalPickerState
    extends State<RegistrationInfoUserHorizontalPicker> {
  late double _currentCentimeters; // Variável de estado adicionada

  @override
  void initState() {
    super.initState();
    _currentCentimeters = widget.currentCentimeters;
  }

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
                textColor: ColorsUI.dark,
                fontSize: 22,
              ),
              const SpaceWidgetAtom(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextAtom(
                    text: '$_currentCentimeters ${widget.suffix}',
                    fontSize: 30,
                  ),
                ],
              ),
              HorizontalPicker(
                minValue: 60,
                maxValue: 238,
                divisions: 170,
                height: 100,
                suffix: widget.suffix,
                initialPosition: InitialPosition.center,
                showCursor: false,
                backgroundColor: Colors.white,
                activeItemTextColor: ColorsUI.primary,
                passiveItemsTextColor: ColorsUI.dark,
                onChanged: (value) {
                  setState(() {
                    _currentCentimeters = value;
                  });
                  widget.onChangeInputHeight?.call(value);
                },
              ),
            ],
          ),
          const SpaceWidgetAtom(height: 54),
          ButtonOrganism.primary(
            textButton: widget.textButton ?? 'Confirmar',
            onPressed: widget.onPressed!,
            width: 232,
          )
        ],
      ),
    );
  }
}
