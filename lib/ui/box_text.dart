import 'package:flutter/material.dart';
import 'package:resilience_muscle/ui/colors.dart';
import 'package:resilience_muscle/ui/typography.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;

  BoxText.headingOne(this.text, {super.key, Color color = ColorsUI.dark})
      : style = heading1Style.copyWith(color: color);

  BoxText.headingTwo(this.text, {super.key, Color color = ColorsUI.dark})
      : style = heading2Style.copyWith(color: color);

  BoxText.headingThree(this.text, {super.key, Color color = ColorsUI.dark})
      : style = heading3Style.copyWith(color: color);

  BoxText.heading(this.text, {super.key, Color color = ColorsUI.dark})
      : style = headingStyle.copyWith(color: color);

  BoxText.subheadingOne(this.text, {super.key, Color color = ColorsUI.dark})
      : style = sub1Style.copyWith(color: color);

  BoxText.subheadingTwo(this.text, {super.key, Color color = ColorsUI.dark})
      : style = sub2Style.copyWith(color: color);

  BoxText.subheadingThree(this.text, {super.key, Color color = ColorsUI.dark})
      : style = sub3Style.copyWith(color: color);

  BoxText.subheading(this.text, {super.key, Color color = ColorsUI.dark})
      : style = subStyle.copyWith(color: color);

  BoxText.bodyOne(this.text, {super.key, Color color = ColorsUI.dark})
      : style = body1Style.copyWith(color: color);

  BoxText.bodyTwo(this.text, {super.key, Color color = ColorsUI.dark})
      : style = body2Style.copyWith(color: color);

  BoxText.bodyThree(this.text, {super.key, Color color = ColorsUI.dark})
      : style = body3Style.copyWith(color: color);

  BoxText.caption(this.text, {super.key, Color color = ColorsUI.dark})
      : style = bodyStyle.copyWith(color: color);

  BoxText.body(this.text, {super.key, Color color = ColorsUI.dark})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
