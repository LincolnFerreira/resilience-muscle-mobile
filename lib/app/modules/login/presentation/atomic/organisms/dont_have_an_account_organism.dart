import 'package:flutter/material.dart';

import '../../../../../../ui/colors.dart';

class DontHaveAnAccountOrganism extends StatelessWidget {
  const DontHaveAnAccountOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Não possui uma conta?',
        style: TextStyle(color: ColorsUI.dark),
        children: <TextSpan>[
          TextSpan(
              text: ' Criar conta', style: TextStyle(color: ColorsUI.primary)),
        ],
      ),
    );
  }
}
