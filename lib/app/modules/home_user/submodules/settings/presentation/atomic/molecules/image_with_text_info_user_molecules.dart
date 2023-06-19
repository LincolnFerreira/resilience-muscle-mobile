import 'package:flutter/material.dart';

import '../../../../../../../../ui/box_text.dart';
import '../../../../../../../../ui/colors.dart';

class ImageWithTextInfoUser extends StatelessWidget {
  final String imageUrl;
  final String nameUser;
  final String emailUser;
  final VoidCallback onTapImageProfile;

  const ImageWithTextInfoUser({
    Key? key,
    required this.imageUrl,
    required this.nameUser,
    required this.emailUser,
    required this.onTapImageProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTapImageProfile,
          child: CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
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
