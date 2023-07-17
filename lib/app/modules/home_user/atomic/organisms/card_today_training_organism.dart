import 'package:flutter/material.dart';

import '../../../../../ui/box_text.dart';
import '../../../../../ui/colors.dart';

class CardTodayTrainingOrganism extends StatelessWidget {
  final String textTrainingDay;
  final String urlTraining;
  final double? width;
  final double? opacity;
  final Function()? onTap;
  final Color? color;
  final BoxText? boxText;

  const CardTodayTrainingOrganism({
    Key? key,
    required this.textTrainingDay,
    required this.urlTraining,
    this.width,
    this.opacity,
    this.onTap,
    this.color,
    this.boxText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.bodyTwo(
            textTrainingDay,
            color: color ?? ColorsUI.dark,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: width ?? double.infinity,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(urlTraining),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(opacity ?? 0.6), BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boxText ?? const Text('Training'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
