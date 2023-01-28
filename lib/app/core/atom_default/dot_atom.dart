import 'package:flutter/cupertino.dart';

import '../colors.dart';

class DotAtom extends StatelessWidget {
  const DotAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 200,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(3.0),
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.white.withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Pallete.white.withOpacity(0.2),
                          blurRadius: 3,
                          offset: Offset(-5, 0),
                          spreadRadius: -10,
                        )
                      ]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
