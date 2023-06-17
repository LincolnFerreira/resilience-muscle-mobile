import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/templates/home_user_template.dart';

import '../../cubit/home_user_cubit.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  HomeUserPageState createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  final cubit = Modular.get<HomeUserCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUserCubit, HomeUserState>(
      bloc: cubit,
      builder: (context, state) {
        return HomeUserTemplate(
          user: cubit.userEntity,
          userInfo: cubit.userInfoEntity,
        );
      },
    );
  }
}
