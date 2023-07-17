import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'typography.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;

  BoxText.headingOne(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: heading1Style.copyWith(color: color));

  BoxText.headingTwo(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: heading2Style.copyWith(color: color));

  BoxText.headingThree(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: heading3Style.copyWith(color: color));

  BoxText.heading(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: headingStyle.copyWith(color: color));

  BoxText.subheadingOne(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: sub1Style.copyWith(color: color));

  BoxText.subheadingTwo(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: sub2Style.copyWith(color: color));

  BoxText.subheadingThree(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: sub3Style.copyWith(color: color));

  BoxText.subheading(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: subStyle.copyWith(color: color));

  BoxText.bodyOne(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: body1Style.copyWith(color: color));

  BoxText.bodyTwo(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: body2Style.copyWith(color: color));

  BoxText.bodyThree(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: body3Style.copyWith(color: color));

  BoxText.caption(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: bodyStyle.copyWith(color: color));

  BoxText.body(this.text, {super.key, Color color = Colors.black})
      : style = GoogleFonts.getFont('Roboto',
            textStyle: bodyStyle.copyWith(color: color));

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
