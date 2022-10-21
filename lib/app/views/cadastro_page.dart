import 'package:flutter/material.dart';
import 'package:resilience_muscle/widgetPersonalizados/button.dart';
import 'package:resilience_muscle/widgetPersonalizados/Input.dart';
import '../../class/cores.dart';

//tela de configuration do app
class CadastroPage extends StatefulWidget {
  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late String email = TextEditingController().text ;
  late String senha = TextEditingController().text ;
  late String confirmaSenha = TextEditingController().text ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Pallete.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: 'Comece de graça!\n',
                            style: TextStyle(color: Pallete.whiteGrey),
                            children: [
                              TextSpan(
                                  text: 'Crie uma conta\n',
                                  style: TextStyle(
                                      color: Pallete.white, fontSize: 26)),
                              TextSpan(
                                  text: 'Já é membro? faça login\n',
                                  style: TextStyle(
                                      color: Pallete.whiteGrey,
                                      fontWeight: FontWeight.normal)),
                            ]),
                        textAlign: TextAlign.start),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // SingleChildScrollView()
                  Input(
                    controller: email,
                    cor: Pallete.primary,
                    labelText: 'Email:',
                    hindText: 'Email:',
                    isObscureText: false,
                    onChanged: (text) {
                      email = text;
                    },
                  ),
                  Input(
                    cor: Pallete.primary,
                    controller: senha,
                    labelText: 'senha:',
                    hindText: 'senha:',
                    isObscureText: true,
                    onChanged: (text) {
                      senha = text;
                    },
                  ),
                  Input(
                    controller: confirmaSenha,
                    cor: Pallete.primary,
                    labelText: 'Confirma senha:',
                    hindText: 'Confirma senha:',
                    isObscureText: true,
                    onChanged: (text) {
                      confirmaSenha = text;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    alignment: Alignment.centerRight,
                    height: 40,
                    child: Button(
                      "Confirmar",

                      // [
                      //   email,
                      //   senha,
                      //   confirmaSenha,
                      // ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
