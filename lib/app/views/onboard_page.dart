import 'package:flutter/material.dart';

import '../../blocked/developerInformation.dart';
import '../../class/cores.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Pallete.gradientDark.withOpacity(0.95),
              Pallete.gradientWhite.withOpacity(0.7),
            ], begin: Alignment.topCenter),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0.1, 0.0),
                                    child: Transform.rotate(
                                      angle: 2,
                                      child: Image.asset(
                                        'assets/images/Polygon.png',
                                        width: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Bem vindo(a)!',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Transform.rotate(
                                  angle: 5,
                                  child: Image.asset(
                                    'assets/images/Polygon.png',
                                    width: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text(
                              'vamos mudar o modo como'
                              '\n vê seus resultados!',
                              style: TextStyle(
                                color: Pallete.whiteGrey,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 150),
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Pallete.primary,
                            onPrimary: Pallete.primary,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/cadastroUser');
                          },
                          child: const Text(
                            'Continuar',
                            style:
                                TextStyle(color: Pallete.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dev()),
                    );
                  },
                  child: const Text(
                    'Todos os direitos reservados © Copyrigth 2022',
                    style: TextStyle(
                      color: Pallete.white,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
