// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleAvatarUserAtom extends StatelessWidget {
  final String imageProfileUser;

  const CircleAvatarUserAtom({
    Key? key,
    required this.imageProfileUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      radius: 25,
      backgroundImage: AssetImage(imageProfileUser),
    );
  }
}
