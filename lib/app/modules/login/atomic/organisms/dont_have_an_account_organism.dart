import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class DontHaveAnAccountOrganism extends StatelessWidget {
  const DontHaveAnAccountOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Não possui uma conta?',
        style: TextStyle(color: Pallete.dark),
        children: <TextSpan>[
          TextSpan(
              text: ' Criar conta', style: TextStyle(color: Pallete.primary)),
        ],
      ),
    );
  }
}
