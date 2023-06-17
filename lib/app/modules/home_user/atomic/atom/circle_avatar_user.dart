import 'package:flutter/material.dart';
import 'package:resilience_muscle/ui/colors.dart';
import 'package:resilience_muscle/ui/resources/assets.dart';

class CircleAvatarUserAtom extends StatelessWidget {
  final String? imageProfileUser;

  const CircleAvatarUserAtom({
    Key? key,
    required this.imageProfileUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsUI.whiteGrey,
      radius: 25,
      backgroundImage: AssetImage(AssetsCollection.menCartoonImage()),
    );
  }
}
