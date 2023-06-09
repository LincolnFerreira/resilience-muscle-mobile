import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/cubit/registration_info_user_cubit.dart';
import 'package:flutter/material.dart';

import '../../../ui/colors.dart';
import '../../core/atom_default/dot_atom.dart';
import '../../core/atom_default/space_widget_atom.dart';
import '../../core/atom_default/text_atom.dart';
import 'atomic/organisms/registration_info_user_account.dart';
import 'atomic/organisms/registration_info_user_horizontal_picker.dart';
import 'atomic/organisms/registration_info_forms.dart';

class RegistrationInfoUserPage extends StatefulWidget {
  const RegistrationInfoUserPage({super.key});

  @override
  RegistrationInfoUserPageState createState() =>
      RegistrationInfoUserPageState();
}

class RegistrationInfoUserPageState extends State<RegistrationInfoUserPage> {
  @override
  void initState() {
    super.initState();
  }

  final cubit = Modular.get<RegistrationInfoUserCubit>();

  TextEditingController nameController = TextEditingController();
  String inputName = '';
  String inputBirthDate = '';
  double inputWeight = 0;
  double inputHeight = 0;
  String inputEmail = '';
  String inputPassword = '';
  String inputConfirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationInfoUserCubit, RegistrationInfoUserState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Modular.to.popAndPushNamed('/login/');
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
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
                        activeIndex: cubit.state.page,
                        count: 5,
                      ),
                    ],
                  ),
                  const SpaceWidgetAtom(height: 40),
                  Column(
                    children: [
                      BlocConsumer<RegistrationInfoUserCubit,
                          RegistrationInfoUserState>(
                        bloc: cubit,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state.page == 0) {
                            return RegistrationInfoForms(
                              onPressed: cubit.onTapButtonContinue,
                              onChangeInput: (e) => {
                                inputName = e,
                              },
                              inputLabelText: 'Nome:',
                              titleForm: 'Como prefere ser chamado ?',
                              formSubtitle:
                                  'Vamos utilizar essa informação para se comunicar melhor com você',
                              validator: cubit.validateName,
                              textButton: 'Continuar ${state.page} /4',
                            );
                          }
                          if (state.page == 1) {
                            return RegistrationInfoForms(
                              formSubtitle: 'Algumas informações a mais...',
                              inputLabelText: 'Data de nascimento:',
                              onChangeInput: (e) => inputBirthDate = e,
                              onPressed: cubit.onTapButtonContinue,
                              validator: cubit.validateBirthDate,
                              textButton: 'Continuar ${state.page} /4',
                            );
                          }
                          if (state.page == 2) {
                            return RegistrationInfoUserHorizontalPicker(
                              onPressed: cubit.onTapButtonContinue,
                              onChangeInputHeight: (e) => inputHeight = e,
                              currentCentimeters: 1.60,
                              suffix: ' Cm',
                              textButton: 'Continuar ${state.page} /4',
                            );
                          }

                          if (state.page == 3) {
                            return RegistrationInfoUserHorizontalPicker(
                              onPressed: cubit.onTapButtonContinue,
                              onChangeInputHeight: (e) => inputWeight = e,
                              currentCentimeters: 80.0,
                              suffix: ' Kg',
                              textButton: 'Continuar ${state.page} /4',
                            );
                          }
                          if (state.page == 4) {
                            return RegistrationInfoUserAccount(
                              onPressed: () => cubit.submitSignUp(
                                  birthDate: inputBirthDate,
                                  email: inputEmail,
                                  height: inputHeight,
                                  name: inputName,
                                  password: inputPassword,
                                  weight: inputWeight),
                              onChangeInputEmail: (e) => inputEmail = e,
                              onChangeInputPassword: (e) => inputPassword = e,
                              onChangeInputConfirmPassword: (e) =>
                                  inputConfirmPassword = e,
                              titleForm: 'Informações da conta',
                              inputLabelTextEmail: 'Email:',
                              inputLabelTextConfirmPassword: "Confirma Senha",
                              inputLabelTextPassword: "Senha",
                              validatorEmail: cubit.validateEmail,
                              validatorPassword: cubit.validatePassword,
                              validatorConfirmPassword:
                                  cubit.validateConfirmPassword(
                                      inputPassword, inputConfirmPassword),
                              textButton: 'Finalizar ${state.page} /4',
                            );
                          }
                          return const SizedBox(
                            child: Text('Erro!'),
                          );
                        },
                      ),
                    ],
                  ),
                  const SpaceWidgetAtom(height: 54),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Map<String, dynamic> registrationUserParams = {
//   'name': {
//     'status': 'done',
//     // 'registrationPageStep': const RegistrationInfoUserName(),
//     'currentStep': 0,
//     'nextPage': '/birth_date'
//   },
//   'birth_date': {
//     'status': 'done',
//     // 'registrationPageStep': RegistrationInfoUserBirthDate(),
//     'currentStep': 1,
//     'nextPage': 'weigth'
//   },
//   'weigth': {
//     'status': 'done',
//     // 'registrationPageStep': const RegistrationInfoUserWeight(),
//     'currentStep': 2,
//     'nextPage': 'height'
//   },
//   'height': {
//     'status': 'done',
//     // 'registrationPageStep': const RegistrationInfoUserHeight(),
//     'currentStep': 3,
//     'nextPage': '/home_user/'
//   }
// };
