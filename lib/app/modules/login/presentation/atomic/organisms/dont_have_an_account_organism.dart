import 'package:flutter/material.dart';

import '../../../../../../ui/colors.dart';

class DontHaveAnAccountOrganism extends StatelessWidget {
  final VoidCallback onTapSignUp;
  const DontHaveAnAccountOrganism({
    required this.onTapSignUp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSignUp,
      child: RichText(
        text: const TextSpan(
          text: 'Não possui uma conta?',
          style: TextStyle(color: ColorsUI.dark),
          children: <TextSpan>[
            TextSpan(
                text: ' Criar conta',
                style: TextStyle(color: ColorsUI.primary)),
          ],
        ),
      ),
    );
  }
}
