import 'package:flutter/material.dart';

import '../../../../../ui/box_text.dart';
import '../../../../../ui/colors.dart';

class ImageWithTextInfoUser extends StatelessWidget {
  final String imageUrl;
  final String nameUser;
  final String emailUser;

  const ImageWithTextInfoUser({
    Key? key,
    required this.imageUrl,
    required this.nameUser,
    required this.emailUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 40,
          backgroundImage: NetworkImage(imageUrl),
        ),
        BoxText.subheadingThree(nameUser),
        BoxText.caption(
          emailUser,
          color: ColorsUI.darkless,
        ),
      ],
    );
  }
}
