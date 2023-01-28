// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/organisms_default/button_organism.dart';
import 'package:resilience_muscle/app/presentation/modules/registration_info_user/text_custom.dart';

import '../../../../../core/atom_default/dot_atom.dart';
import '../../../../../core/colors.dart';

class RegistrationInfoUserMain extends StatelessWidget {
  final dynamic page;
  final int currentStep;
  const RegistrationInfoUserMain({
    Key? key,
    required this.page,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // color: Pallete.darkless,
              height: 300,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Image.asset('assets/images/user?.png'),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextAtom(
                    text: TextCustom.basicInformationsTitle,
                    style: GoogleFonts.roboto(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextAtom(
                    text: TextCustom.basicInformationsSubText,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  page,
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonOrganism(
                      onPressed: () {},
                      textButton: 'Continuar',
                      textSize: 16,
                      heigth: 40,
                    ),
                  ),
                  const Align(
                    child: DotAtom(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
