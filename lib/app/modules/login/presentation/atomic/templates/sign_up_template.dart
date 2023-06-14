import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resilience_muscle/ui/box_text.dart';

import '../../../../../../ui/colors.dart';
import '../../../../../core/atom_default/input_atom.dart';
import '../../../../../core/atom_default/logo_atom.dart';
import '../../../../../core/atom_default/space_widget_atom.dart';
import '../../../../../core/organisms_default/button_organism.dart';

class SignUpTemplate extends StatefulWidget {
  final VoidCallback? onPressedButtonSubmitSignUp;
  final Function(String)? onChangeInputEmail;
  final Function(String)? onChangeInputPassword;
  final Function(String)? onChangeInputConfirmPassword;
  final String? titleForm;
  final String inputLabelTextEmail;
  final String inputLabelTextPassword;
  final String inputLabelTextConfirmPassword;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;
  final VoidCallback onPressedBackPage;
  final String? textButton;

  const SignUpTemplate({
    super.key,
    required this.onPressedButtonSubmitSignUp,
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
    required this.onPressedBackPage,
  });

  @override
  State<SignUpTemplate> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpTemplate> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  bool onChangeCheckboxTerm = false;

  @override
  Widget build(BuildContext context) {
    bool isValidateConfirmPassword = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: widget.onPressedBackPage,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SpaceWidgetAtom(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: LogoAtom()),
                  const SpaceWidgetAtom(height: 40),
                  BoxText.headingThree(
                    'Cadastre-se',
                  ),
                  const SpaceWidgetAtom(height: 40),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputAtom(
                          labelText: widget.inputLabelTextEmail,
                          prefixIcon: const FaIcon(Icons.person),
                          onChanged: widget.onChangeInputEmail,
                          validator: widget.validatorEmail,
                        ),
                        const SpaceWidgetAtom(height: 20),
                        InputAtom(
                          labelText: widget.inputLabelTextPassword,
                          prefixIcon: const FaIcon(Icons.key),
                          onChanged: widget.onChangeInputPassword,
                          validator: widget.validatorPassword,
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SpaceWidgetAtom(height: 20),
                        InputAtom(
                          obscureText: true,
                          labelText: widget.inputLabelTextConfirmPassword,
                          prefixIcon: const FaIcon(Icons.key),
                          onChanged: widget.onChangeInputConfirmPassword,
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
              Row(
                children: [
                  Checkbox(
                    checkColor: ColorsUI.white,
                    activeColor: ColorsUI.primary,
                    value: onChangeCheckboxTerm,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          3)), // Valor do raio de arredondamento desejado
                    ),
                    onChanged: (value) {
                      setState(() {
                        onChangeCheckboxTerm = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Wrap(
                      children: const [
                        Text(
                          'Li e estou de acordo com o ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: ColorsUI.dark,
                          ),
                        ),
                        Text(
                          'Termo de uso e política de privacidade ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: ColorsUI.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ButtonOrganism.primary(
                disabled: !onChangeCheckboxTerm,
                textButton: widget.textButton ?? 'Confirmar',
                onPressed: () {
                  if (formKey.currentState?.validate() == true ||
                      isValidateConfirmPassword == true) {
                    widget.onPressedButtonSubmitSignUp?.call();
                  }
                },
                width: 232,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
