import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../ui/resources/assets.dart';
import '../../../../../core/atom_default/space_widget_atom.dart';
import '../../../../../core/atom_default/text_atom.dart';
import '../../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoImageProfile extends StatelessWidget {
  final String? titleForm;
  final String? formSubtitle;
  final VoidCallback? onPressed;
  final String imageUrl;
  final VoidCallback onTapImageProfile;

  const RegistrationInfoImageProfile({
    super.key,
    this.titleForm,
    this.formSubtitle,
    required this.onPressed,
    required this.imageUrl,
    required this.onTapImageProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceWidgetAtom(height: 30),
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextAtom(
                text: titleForm ?? 'Foto de perfil',
                style: GoogleFonts.roboto(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            TextAtom(
              text: formSubtitle ??
                  'Escolha uma foto que goste, de preferência uma atual para ir comparando conforme o tempo, ou escolha um de nossos avatares.',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            InkWell(
              onTap: onTapImageProfile,
              child: CircleAvatar(
                maxRadius: 40,
                backgroundImage: AssetImage(imageUrl),
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          AssetsCollection.menCartoonImage(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          AssetsCollection.womanCartoonImage(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceWidgetAtom(height: 20),
            ButtonOrganism.primary(
              textButton: 'Confirmar',
              onPressed: onPressed ?? () {},
              width: 232,
            )
          ],
        )
      ],
    );
  }
}
