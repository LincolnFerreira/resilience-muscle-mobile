import 'package:flutter/material.dart';
import 'package:testef/loginUser.dart';
import 'package:testef/configUser.dart';

import 'dev.dart';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffb252526)),
      color: Pallete.white,
      //remove o banner de debug
      debugShowCheckedModeBanner: false,
      home: dev(),
    ),
  );
}

class Pallete {
  static const Color dark = Color(0xffb252526);
  static const Color primary = Color(0xffb42257C);
  static const Color second = Color(0xffb5666F6);
  static const Color white = Color(0xffbEFEFEF);
  static const Color green = Color(0xffb00DA87);
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Pallete.dark,
      //   title: const Text('Resilience Muscle'),
      //   centerTitle: true,
      // ),
      //o Text.rich ele possibilita conseguir dar style no texto
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Seja bem vindo!',
              style: TextStyle(color: Pallete.white, fontSize: 20, fontFamily: 'Jura', fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 30),
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
            SizedBox(height: 30),
            const Text.rich(
              TextSpan(
                  text: 'Vamos começar a mudar o\n'
                      'modo como vê sua\n',
                  style: TextStyle(color: Pallete.white, fontSize: 20, fontFamily: 'Jura', fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'evolução?!\n',
                        style: TextStyle(
                            color: Pallete.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {return configUser();})
                  );
                },
                child: const Text('Começar!'),
                style: ElevatedButton.styleFrom(primary: Pallete.primary)),
            Column(
              children: const <Widget>[],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(

        color: Colors.transparent,
        child: Text(
          'Todos os direitos reservados © Copyrigth 2022',
          style: TextStyle(
            color: Pallete.white,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),

      ),
    );
  }
}
