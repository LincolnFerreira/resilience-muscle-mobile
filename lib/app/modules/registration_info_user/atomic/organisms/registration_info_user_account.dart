import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../ui/colors.dart';
import '../../../../core/atom_default/input_atom.dart';
import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/atom_default/text_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserAccount extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final VoidCallback? onPressed;
  final Function(String)? onChangeInputEmail;
  final Function(String)? onChangeInputPassword;
  final Function(String)? onChangeInputConfirmPassword;
  final String? titleForm;
  final String inputLabelTextEmail;
  final String inputLabelTextPassword;
  final String inputLabelTextConfirmPassword;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final String? textButton;

  RegistrationInfoUserAccount({
    super.key,
    required this.onPressed,
    required this.onChangeInputEmail,
    required this.onChangeInputPassword,
    required this.onChangeInputConfirmPassword,
    required this.titleForm,
    required this.inputLabelTextEmail,
    required this.inputLabelTextPassword,
    required this.inputLabelTextConfirmPassword,
    this.validatorEmail,
    this.validatorPassword,
    this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    bool isValidateConfirmPassword = false;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SpaceWidgetAtom(height: 40),
          Column(
            children: [
              const TextAtom(
                text: 'Informações da conta',
                textColor: ColorsUI.dark,
                fontSize: 22,
              ),
              const SpaceWidgetAtom(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputAtom(
                      labelText: inputLabelTextEmail,
                      prefixIcon: const FaIcon(Icons.person),
                      onChanged: onChangeInputEmail,
                      validator: validatorEmail,
                    ),
                    const SpaceWidgetAtom(height: 20),
                    InputAtom(
                      labelText: inputLabelTextPassword,
                      prefixIcon: const FaIcon(Icons.key),
                      onChanged: onChangeInputPassword,
                      validator: validatorPassword,
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SpaceWidgetAtom(height: 20),
                    InputAtom(
                      obscureText: true,
                      labelText: inputLabelTextConfirmPassword,
                      prefixIcon: const FaIcon(Icons.key),
                      onChanged: onChangeInputConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a confirmação de senha.';
                        }
                        if (value != passwordController.text) {
                          return 'As senhas não coincidem.';
                        }
                        isValidateConfirmPassword = true;
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SpaceWidgetAtom(height: 54),
          ButtonOrganism.primary(
            textButton: textButton ?? 'Confirmar',
            onPressed: () {
              if (formKey.currentState?.validate() == true ||
                  isValidateConfirmPassword == true) {
                onPressed?.call();
              }
            },
            width: 232,
          ),
        ],
      ),
    );
  }
}
