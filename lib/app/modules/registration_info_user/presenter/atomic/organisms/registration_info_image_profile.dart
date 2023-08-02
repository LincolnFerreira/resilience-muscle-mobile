// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/atomic/molecules/image_placeholder.dart';

import '../../../../../../ui/resources/assets.dart';
import '../../../../../core/atom_default/space_widget_atom.dart';
import '../../../../../core/atom_default/text_atom.dart';
import '../../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoImageProfile extends StatefulWidget {
  final String? titleForm;
  final String? formSubtitle;
  final VoidCallback? onPressed;
  final dynamic imageUrl;
  final VoidCallback onTapImageProfile;
  final Function(dynamic) onClickImage;

  const RegistrationInfoImageProfile({
    Key? key,
    this.titleForm,
    this.formSubtitle,
    required this.onPressed,
    required this.imageUrl,
    required this.onTapImageProfile,
    required this.onClickImage,
  }) : super(key: key);

  @override
  State<RegistrationInfoImageProfile> createState() =>
      _RegistrationInfoImageProfileState();
}

class _RegistrationInfoImageProfileState
    extends State<RegistrationInfoImageProfile> {
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
                text: widget.titleForm ?? 'Foto de perfil',
                style: GoogleFonts.roboto(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            TextAtom(
              text: widget.formSubtitle ??
                  'Escolha uma foto que goste, de preferência uma atual para ir comparando conforme o tempo, ou escolha um de nossos avatares.',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            InkWell(
              onTap: widget.onTapImageProfile,
              child: CircleAvatar(
                maxRadius: 90,
                backgroundImage: _getImageProvider(widget.imageUrl),
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: [
                ImagePlaceholder(
                  imageUrl: AssetsCollection.menCartoonImage(),
                  onClickImage: widget.onClickImage,
                ),
                ImagePlaceholder(
                  imageUrl: AssetsCollection.womanCartoonImage(),
                  onClickImage: widget.onClickImage,
                )
              ],
            ),
            const SpaceWidgetAtom(height: 20),
            ButtonOrganism.primary(
              textButton: 'Confirmar',
              onPressed: widget.onPressed ?? () {},
              width: 232,
            )
          ],
        )
      ],
    );
  }
}

ImageProvider<Object>? _getImageProvider(dynamic imageUrl) {
  if (imageUrl is String) {
    return AssetImage(imageUrl);
  } else if (imageUrl is XFile) {
    return FileImage(File(imageUrl.path));
  } else {
    return AssetImage('');
  }
}
