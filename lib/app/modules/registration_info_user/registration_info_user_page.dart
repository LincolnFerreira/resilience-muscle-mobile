import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/cubit/registration_info_user_cubit.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_store.dart';
import 'package:flutter/material.dart';

import '../../../ui/colors.dart';
import '../../core/atom_default/dot_atom.dart';
import '../../core/atom_default/space_widget_atom.dart';
import '../../core/atom_default/text_atom.dart';
import 'atomic/organisms/registration_info_user_birth_date.dart';
import 'atomic/organisms/registration_info_user_height.dart';
import 'atomic/organisms/registration_info_user_name.dart';
import 'atomic/organisms/registration_info_user_weight.dart';

class RegistrationInfoUserPage extends StatefulWidget {
  const RegistrationInfoUserPage({super.key});

  @override
  RegistrationInfoUserPageState createState() =>
      RegistrationInfoUserPageState();
}

class RegistrationInfoUserPageState extends State<RegistrationInfoUserPage> {
  final RegistrationInfoUserStore store = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  final cubit = Modular.get<RegistrationInfoUserCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationInfoUserCubit, RegistrationInfoUserState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
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
                    count: 4,
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
                        return RegistrationInfoUserName(
                          onPressed: cubit.onTapButton,
                        );
                      }
                      if (state.page == 1) {
                        return RegistrationInfoUserBirthDate(
                          onPressed: cubit.onTapButton,
                        );
                      }
                      if (state.page == 2) {
                        return RegistrationInfoUserHeight(
                          onPressed: cubit.onTapButton,
                        );
                      }

                      if (state.page == 3) {
                        return RegistrationInfoUserWeight(onPressed: () {
                          Modular.to.navigate('/home_user');
                        });
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
    );
  }
}

Map<String, dynamic> registrationUserParams = {
  'name': {
    'status': 'done',
    // 'registrationPageStep': const RegistrationInfoUserName(),
    'currentStep': 0,
    'nextPage': '/birth_date'
  },
  'birth_date': {
    'status': 'done',
    // 'registrationPageStep': RegistrationInfoUserBirthDate(),
    'currentStep': 1,
    'nextPage': 'weigth'
  },
  'weigth': {
    'status': 'done',
    // 'registrationPageStep': const RegistrationInfoUserWeight(),
    'currentStep': 2,
    'nextPage': 'height'
  },
  'height': {
    'status': 'done',
    // 'registrationPageStep': const RegistrationInfoUserHeight(),
    'currentStep': 3,
    'nextPage': '/home_user/'
  }
};
