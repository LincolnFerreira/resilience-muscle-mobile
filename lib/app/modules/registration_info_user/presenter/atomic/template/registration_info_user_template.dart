// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/atomic/organisms/registration_info_image_profile.dart';

import '../../../../../../ui/colors.dart';
import '../../../../../core/atom_default/dot_atom.dart';
import '../../../../../core/atom_default/space_widget_atom.dart';
import '../../../../../core/atom_default/text_atom.dart';
import '../../../../../core/validator_functions.dart';
import '../organisms/registration_info_forms.dart';
import '../organisms/registration_info_user_horizontal_picker.dart';

class RegistrationInfoUserTemplate extends StatelessWidget {
  final VoidCallback onPressedBackPage;
  final int currentPage;
  final int totalPage = 5;
  final Map<String, dynamic> inputValues;
  final VoidCallback onTapButtonContinue;
  final String? Function(String?)? validatorName;
  final String? Function(String?)? validatorPassword;
  final String? Function(String?)? validatorBirthDate;
  final VoidCallback onPressedRegisterInfoUser;
  final VoidCallback onPressedContinueToTraining;
  final Function(dynamic) onClickImageSelected;

  final dynamic imageUrl;
  final VoidCallback onTapImageProfile;

  const RegistrationInfoUserTemplate({
    Key? key,
    required this.onPressedBackPage,
    required this.currentPage,
    required this.inputValues,
    required this.onTapButtonContinue,
    this.validatorName,
    this.validatorPassword,
    this.validatorBirthDate,
    required this.onPressedRegisterInfoUser,
    required this.onPressedContinueToTraining,
    required this.onClickImageSelected,
    required this.imageUrl,
    required this.onTapImageProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: onPressedBackPage),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        key: UniqueKey(),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextAtom(
                    text: 'Informações de usuário',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: ColorsUI.primary,
                    ),
                  ),
                  DotAtom(
                    activeIndex: currentPage,
                    count: totalPage,
                  ),
                ],
              ),
              const SpaceWidgetAtom(height: 40),
              Column(
                children: [
                  if (currentPage == 0)
                    RegistrationInfoForms(
                      onPressed: onTapButtonContinue,
                      onChangeInput: (e) => inputValues['name'] = e,
                      inputLabelText: 'Nome:',
                      titleForm: 'Como prefere ser chamado ?',
                      formSubtitle:
                          'Vamos utilizar essa informação para se comunicar melhor com você',
                      validator: validatorName,
                      textButton: 'Continuar ${currentPage + 1} /4',
                      keyboardType: TextInputType.name,
                    )
                  else if (currentPage == 1)
                    RegistrationInfoForms(
                      formSubtitle: 'Algumas informações a mais...',
                      inputLabelText: 'Data de nascimento:',
                      onChangeInput: (e) => inputValues['birthDate'] = e,
                      onPressed: onTapButtonContinue,
                      validator: validatorBirthDate,
                      textButton: 'Continuar ${currentPage + 1} /4',
                      inputFormatter: [maskFormatter],
                      keyboardType: TextInputType.datetime,
                    )
                  else if (currentPage == 2)
                    RegistrationInfoUserHorizontalPicker(
                      onPressed: onTapButtonContinue,
                      onChangeInputHeight: (e) => inputValues['height'] = e,
                      currentValueHorizontalPicker: 1.65,
                      suffix: ' Cm',
                      textButton: 'Continuar ${currentPage + 1} /4',
                    )
                  else if (currentPage == 3)
                    RegistrationInfoUserHorizontalPicker(
                      onPressed: onTapButtonContinue,
                      onChangeInputHeight: (e) => inputValues['weight'] = e,
                      currentValueHorizontalPicker: 80.0,
                      suffix: ' Kg',
                      titleInfo: 'Qual o seu peso?',
                      textButton: 'Continuar ${currentPage + 1} /4',
                    )
                  else if (currentPage == 4)
                    RegistrationInfoImageProfile(
                      imageUrl: imageUrl,
                      onTapImageProfile: onTapImageProfile,
                      onPressed: onPressedRegisterInfoUser,
                      onClickImage: onClickImageSelected,
                    )
                  else
                    const SizedBox(
                      child: Text('Erro!'),
                    ),
                ],
              ),
              const SpaceWidgetAtom(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
