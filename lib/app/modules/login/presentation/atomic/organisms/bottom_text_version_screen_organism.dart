import 'package:flutter/material.dart';

import '../../../../../../ui/colors.dart';
import '../../../../../core/strings.dart';

class BottomTextVersionScreenOrganism extends StatelessWidget {
  const BottomTextVersionScreenOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Text(
        textAlign: TextAlign.center,
        'Version $versionAppLabel | Powered by Lincoln Ferreira',
        style: TextStyle(color: ColorsUI.dark63),
      ),
    );
  }
}
