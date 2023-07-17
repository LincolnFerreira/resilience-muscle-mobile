import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_cubit.dart';
import 'app_state.dart';
import 'ui/colors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

final cubit = Modular.get<AppCubit>();

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Resilience Muscle',
          builder: Asuka.builder,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          // darkTheme: ThemeData(brightness: Brightness.dark),
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsUI.white,
            textTheme: const TextTheme(),
            inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsUI.primary,
                ), // Defina a cor desejada para a borda
              ),
            ), //visualDensity pesquisar sobre
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          // color: ColorsUI.dark,
        );
      },
    );
  }
}
