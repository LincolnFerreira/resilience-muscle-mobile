// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';

import 'package:resilience_muscle/app/core/colors.dart';
import 'package:resilience_muscle/app/core/organisms_default/button_organism.dart';

class BoxReadyTrainingOrganism extends StatelessWidget {
  final double? height;
  const BoxReadyTrainingOrganism({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.darkless,
      width: double.infinity,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextAtom(
                text: 'Treino de hoje!',
                textColor: Pallete.whiteGrey,
                fontSize: 15,
              ),
              const ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Pallete.whiteGrey,
                  size: 20,
                ),
                title: TextAtom(
                  text: 'Supino',
                  textColor: Pallete.whiteGrey,
                  fontSize: 12,
                ),
              ),
              const ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Pallete.whiteGrey,
                  size: 20,
                ),
                title: TextAtom(
                  text: 'Supino',
                  textColor: Pallete.whiteGrey,
                  fontSize: 12,
                ),
              ),
              const ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Pallete.whiteGrey,
                  size: 20,
                ),
                title: TextAtom(
                  text: 'Supino',
                  textColor: Pallete.whiteGrey,
                  fontSize: 12,
                ),
              ),
              ButtonOrganism(
                onPressed: () {},
                textButton: 'Começar',
                foregroundColor: Pallete.green,
                backgroundColor: Pallete.darkless,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
