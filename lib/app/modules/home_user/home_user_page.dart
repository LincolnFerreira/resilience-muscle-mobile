import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  HomeUserPageState createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final HomeUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
