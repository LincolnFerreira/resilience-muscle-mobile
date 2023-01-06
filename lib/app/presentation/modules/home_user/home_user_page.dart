import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/presentation/modules/home_user/home_user_store.dart';
import 'package:flutter/material.dart';

import '../../../../subs/class/cores.dart';

class HomeUserPage extends StatefulWidget {
  final String title;
  const HomeUserPage({Key? key, this.title = 'HomeUserPage'}) : super(key: key);
  @override
  HomeUserPageState createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final HomeUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Bem vinda,\n',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  children: [
                    TextSpan(
                      text: ' Cecília Sousa',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.notifications,
                  color: Pallete.white,
                  size: 33,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
