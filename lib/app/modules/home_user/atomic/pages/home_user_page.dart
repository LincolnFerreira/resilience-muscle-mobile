import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cubit/home_user_cubit.dart';
import '../organisms/bottom_navigation_bar_organism.dart';
import '../templates/home_user_template.dart';

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
          bottomNavigationBarOrganism: const BottomNavigationBarOrganism(
            currentPage: PageName.home,
          ),
        );
      },
    );
  }
}
