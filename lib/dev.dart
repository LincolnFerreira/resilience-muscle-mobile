import 'package:flutter/material.dart';
import 'package:testef/main.dart';

class dev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/Dev.jpg'),
                      ),
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
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //Card 1
                    SizedBox(
                      width: 380,
                      child: ExpansionTile(
                        collapsedIconColor: Pallete.white,
                        collapsedTextColor: Pallete.white,
                        backgroundColor: Pallete.primary,
                        collapsedBackgroundColor: Pallete.primary,
                        title: Text(
                          'Web',
                          style: TextStyle(color: Pallete.white),
                        ),
                        subtitle: Text(
                          'html, css, js, node',
                          style: TextStyle(color: Colors.grey),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Card 1

                    SizedBox(
                      width: 380,
                      child: ExpansionTile(
                        collapsedIconColor: Pallete.white,
                        collapsedTextColor: Pallete.white,
                        backgroundColor: Pallete.primary,
                        collapsedBackgroundColor: Pallete.primary,
                        title: Text(
                          'Java',
                          style: TextStyle(color: Pallete.white),
                        ),
                        subtitle: Text(
                          'Java (basico)',
                          style: TextStyle(color: Colors.grey),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          )
                        ],
                      ),
                    ),
                    //Card 1

                    SizedBox(
                      width: 380,
                      child: ExpansionTile(
                        collapsedIconColor: Pallete.white,
                        collapsedTextColor: Pallete.white,
                        backgroundColor: Pallete.primary,
                        collapsedBackgroundColor: Pallete.primary,
                        title: Text(
                          'Metodologia',
                          style: TextStyle(color: Pallete.white),
                        ),
                        subtitle: Text(
                          'html, css, js',
                          style: TextStyle(color: Colors.grey),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              'Expandiu!!',
                              style: TextStyle(color: Pallete.green),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
