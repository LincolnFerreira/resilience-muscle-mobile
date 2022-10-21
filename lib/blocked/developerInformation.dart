import 'package:flutter/material.dart';
import '../class/cores.dart';
import '../class/developer/dev.dart';

class dev extends StatelessWidget {
  final categoriaArr = [
    "Web",
    "Linguagem de programação",
    "Metodologia",
    "Repositórios",
    "Contato"
  ];
  final subtitleArr = ["Site", "Java", "Metodologias", "Git", "informações"];
  final informacaoArr = [
    "html, css, js, node",
    "Orientação a objetos",
    "Agíl",
    "github.com/Lincoln Ferreira",
    "github/LincolnFerreira"
  ];

  /*
   Infocards
   */

  List<CardList> infoCard = [
    CardList("Web", "Aplicação", ["HTML", "Css", "Js"]),
  ];

  @override
  Widget build(BuildContext context) {
    print(infoCard.length);
    print(infoCard[0].topico.length);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Foto, título e subtítulo
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: const [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Dev.jpg'),
                            radius: 45),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Lincoln F. de Jesus',
                      style: TextStyle(color: Pallete.white, fontSize: 18),
                    ),
                  ),
                  const Text(
                    'Áreas de conhecimento:',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            //Cards de informações
            Expanded(
              flex: 4,
              //Fractionally permite utilizar o widthFactor e heigthFactor
              // o "Factor" permite utilizar porcentagem em ambos ex: 0.7 = 70%
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ListView.builder(
                  itemCount: categoriaArr.length,
                  itemBuilder: (BuildContext context, int index) {
                    final categoria = categoriaArr[index];
                    final subtitle = subtitleArr[index];
                    return ExpansionTile(
                      collapsedIconColor: Pallete.white,
                      collapsedTextColor: Pallete.white,
                      backgroundColor: Pallete.primary,
                      collapsedBackgroundColor: Pallete.primary,
                      title: Text(
                        categoria,
                        style: const TextStyle(color: Pallete.white),
                      ),
                      subtitle: Text(
                        // (subtitle != null) ? subtitle : 'nada',
                        subtitle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      children: [
                        ListView.builder(
                          itemCount: infoCard[0].topico.length,
                          itemBuilder: (BuildContext context, int indexdois) {
                            final topico = infoCard[index].topico[indexdois];
                            return Container(
                              width: double.infinity,
                              child: ListTile(
                                title: Text(
                                  topico,
                                  style: TextStyle(color: Pallete.green),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// children: [
//Card 1
// SizedBox(
//   width: 380,
//   child: ExpansionTile(
//     collapsedIconColor: Pallete.white,
//     collapsedTextColor: Pallete.white,
//     backgroundColor: Pallete.primary,
//     collapsedBackgroundColor: Pallete.primary,
//     title: Text(
//       'Web',
//       style: TextStyle(color: Pallete.white),
//     ),
//     subtitle: Text(
//       'html, css, js, node',
//       style: TextStyle(color: Colors.grey),
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       ),
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       ),
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       ),
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       ),
//     ],
//   ),
// ),
// //Card 1
//
// SizedBox(
//   width: 380,
//   child: ExpansionTile(
//     collapsedIconColor: Pallete.white,
//     collapsedTextColor: Pallete.white,
//     backgroundColor: Pallete.primary,
//     collapsedBackgroundColor: Pallete.primary,
//     title: Text(
//       'Java',
//       style: TextStyle(color: Pallete.white),
//     ),
//     subtitle: Text(
//       'Java (basico)',
//       style: TextStyle(color: Colors.grey),
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       )
//     ],
//   ),
// ),
// //Card 1
//
// SizedBox(
//   width: 380,
//   child: ExpansionTile(
//     collapsedIconColor: Pallete.white,
//     collapsedTextColor: Pallete.white,
//     backgroundColor: Pallete.primary,
//     collapsedBackgroundColor: Pallete.primary,
//     title: Text(
//       'Metodologia',
//       style: TextStyle(color: Pallete.white),
//     ),
//     subtitle: Text(
//       'html, css, js',
//       style: TextStyle(color: Colors.grey),
//     ),
//     children: [
//       ListTile(
//         title: Text(
//           'Expandiu!!',
//           style: TextStyle(color: Pallete.green),
//         ),
//       )
//     ],
//   ),
// ),

// ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
