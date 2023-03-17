// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:resilience_muscle/ui/colors.dart';
import 'package:resilience_muscle/ui/typography.dart';

class CardTodayTrainingOrganism extends StatelessWidget {
  final String textTrainingDay;
  final String urlTraining;
  final String cardTrainingText;
  final double? width;
  final double? opacity;
  final Function()? onTap;

  const CardTodayTrainingOrganism({
    Key? key,
    required this.textTrainingDay,
    required this.urlTraining,
    required this.cardTrainingText,
    this.width,
    this.opacity,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTrainingDay,
            style: bodyStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: width ?? double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(urlTraining),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    ColorsUI.dark.withOpacity(opacity ?? 0.6),
                    BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTrainingText,
                    style: headingStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
