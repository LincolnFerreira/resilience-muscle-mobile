import 'package:flutter/material.dart';
import 'package:testef/main.dart';

//tela de configuração do app
class screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      appBar: AppBar(
       // leading: Icon(Icons.arrow_back, color: Pallete.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),*/
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: const Text.rich(
                TextSpan(
                  text: 'Comece agora de graça\n',),
                // Crie sua conta'),
              ),
            ),
          ),
          Expanded(child: Container(),),
          Expanded(child: Container(child: Text(''),),),
        ],
      ),
    );
  }
}