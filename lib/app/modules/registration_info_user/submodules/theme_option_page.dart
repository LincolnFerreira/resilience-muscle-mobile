// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/registration_strings.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/submodules/atomic/toggle_theme_atom.dart';

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
      backgroundColor: light ? Pallete.white : Pallete.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextAtom(
            text: RegistrationStrings.titleThemeOption,
            fontSize: 26,
            textColor: light ? Pallete.dark : Pallete.white,
          ),
          const SpaceWidgetAtom(height: 40),
          Text(RegistrationStrings.textThemeOption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: light ? Pallete.dark : Pallete.white,
              )),
          const SpaceWidgetAtom(height: 118),
          ToggleThemeAtom(
            color: light ? null : Pallete.dark,
            child: Row(
              children: [
                ToggleThemeAtom(
                  width: 125,
                  color: light ? Pallete.white : Colors.transparent,
                  child: const Center(
                    child: Text(
                      'Claro',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Pallete.dark),
                    ),
                  ),
                ),
                ToggleThemeAtom(
                  width: 125,
                  color: light ? Colors.transparent : Pallete.dark,
                  child: Center(
                    child: Text(
                      'Escuro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: light
                            ? Pallete.dark.withOpacity(0.5)
                            : Pallete.white,
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
