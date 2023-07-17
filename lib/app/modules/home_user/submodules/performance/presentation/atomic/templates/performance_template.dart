import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/bottom_navigation_bar_organism.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/performance/presentation/atomic/atom/calendar_horizontal_atom.dart';
import 'package:resilience_muscle/ui/box_text.dart';
import 'package:resilience_muscle/ui/colors.dart';

class PerformanceTemplate extends StatefulWidget {
  final BottomNavigationBarOrganism bottomNavigationBarOrganism;
  final DateTime? currentDateSelected;

  const PerformanceTemplate({
    Key? key,
    required this.bottomNavigationBarOrganism,
    this.currentDateSelected,
  }) : super(key: key);

  @override
  State<PerformanceTemplate> createState() => _PerformanceTemplateState();
}

class _PerformanceTemplateState extends State<PerformanceTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(
            height: 80,
            color: Colors.transparent,
          ),
          CalendarHorizontalAtom(
            currentDateSelected: widget.currentDateSelected ?? DateTime.now(),
          ),
          const Divider(height: 40),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoxText.subheadingOne('Registros do treino'),
                    const Icon(
                      Icons.info,
                      color: Color.fromARGB(255, 248, 223, 3),
                    )
                  ],
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    text: 'Treino executado: ',
                    children: const [
                      TextSpan(text: 'Treino A'),
                    ],
                  ),
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                Row(
                  children: [
                    const Icon(Icons.punch_clock),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontSize: 16),
                        text: 'Duração: ',
                        children: const [
                          TextSpan(text: ' 1h 16m '),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    text: 'Foco: ',
                    children: const [
                      TextSpan(text: 'Força'),
                    ],
                  ),
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    text: 'Intensidade: ',
                    children: const [
                      TextSpan(text: 'Alta'),
                    ],
                  ),
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                RichText(
                  text: TextSpan(
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    text: 'Satisfação com o treino: ',
                    children: const [
                      TextSpan(text: 'Mediana'),
                    ],
                  ),
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 249, 249),
                    border: Border.all(
                      color: const Color.fromARGB(255, 249, 249, 249),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: const ExpansionTile(
                    title: Text('Movimentos executados'),
                    textColor: Colors.black,
                    collapsedTextColor: Colors.black,
                    iconColor: ColorsUI.primary,
                    collapsedIconColor: ColorsUI.primaryLight,
                    children: [
                      ListTile(
                        title: Text('Conteúdo do Expansível'),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 32,
                ),
                BoxText.bodyThree('Autocrítica'),
                const Divider(
                  height: 24,
                  color: Colors.transparent,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Não achei que o treino rendeu o suficiente, estava meio mal...😟',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(fontSize: 16),
                        ),
                        const Divider(
                          height: 16,
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return index < 2
                                ? const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 213, 0),
                                  )
                                : const Icon(
                                    Icons.star_border_outlined,
                                    color: Color.fromARGB(255, 255, 213, 0),
                                  );
                          }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBarOrganism,
    );
  }
}
