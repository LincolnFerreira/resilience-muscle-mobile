import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/settings/settings_store.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final SettingsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Pallete.white,
              onPressed: () {
                Modular.to.navigate('/home_user/');
              }),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          /*
        Foto perfil
       */
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                // lembre do flexbox do html

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Perfil',
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.8,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(6)),
                      width: 100,
                      height: 90,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '{user.name}',
                      style: TextStyle(
                        color: Pallete.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*
        Buttons com onPressed
       */
          Expanded(
            flex: 4,
            child: Center(
              child: SizedBox(
                width: 350,
                height: 200,
                //color: Colors.white,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 47,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: const BorderSide(color: Colors.white),
                        ),
                        icon: const Icon(Icons.account_circle_rounded),
                        label: const Text('Dados cadastrados'),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 47,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: const BorderSide(color: Colors.white),
                        ),
                        icon: const Icon(Icons.logout),
                        label: const Text('Sair'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Modular.to.navigate('/login/');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 3,
          //   child: Switch(
          //     value: SwitchController.instance.isDarkTheme,
          //     onChanged: (value) {
          //       SwitchController.instance.changeTheme();
          //       setState(() {
          //         value = !SwitchController.instance.isDarkTheme;
          //       });
          //     },
          //   ),
          // ),
          /*
       Rodape
        */
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Precisa de ajuda ?',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Entre em contato',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'lincoln.carmo@sptech.school',
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
