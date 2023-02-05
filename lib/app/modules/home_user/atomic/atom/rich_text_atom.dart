// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class RichTextAtom extends StatelessWidget {
  final String? textWelcome;

  final String? textNameUser;

  const RichTextAtom({
    Key? key,
    required this.textWelcome,
    required this.textNameUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: textWelcome,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            children: [
          TextSpan(
            text: textNameUser,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          )
        ]));
  }
}
