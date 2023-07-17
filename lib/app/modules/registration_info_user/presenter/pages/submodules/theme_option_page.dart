// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/pages/submodules/atomic/toggle_theme_atom.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/registration_strings.dart';

import '../../../../../../../ui/colors.dart';

class ThemeOptionPage extends StatefulWidget {
  const ThemeOptionPage({super.key});

  @override
  State<ThemeOptionPage> createState() => _ThemeOptionPageState();
}

class _ThemeOptionPageState extends State<ThemeOptionPage> {
  final bool light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light ? ColorsUI.white : ColorsUI.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextAtom(
            text: RegistrationStrings.titleThemeOption,
            fontSize: 26,
            textColor: light ? ColorsUI.dark : ColorsUI.white,
          ),
          const SpaceWidgetAtom(height: 40),
          Text(RegistrationStrings.textThemeOption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: light ? ColorsUI.dark : ColorsUI.white,
              )),
          const SpaceWidgetAtom(height: 118),
          ToggleThemeAtom(
            color: light ? null : ColorsUI.dark,
            child: Row(
              children: [
                ToggleThemeAtom(
                  width: 125,
                  color: light ? ColorsUI.white : Colors.transparent,
                  child: const Center(
                    child: Text(
                      'Claro',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: ColorsUI.dark),
                    ),
                  ),
                ),
                ToggleThemeAtom(
                  width: 125,
                  color: light ? Colors.transparent : ColorsUI.dark,
                  child: Center(
                    child: Text(
                      'Escuro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: light
                            ? ColorsUI.dark.withOpacity(0.5)
                            : ColorsUI.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
