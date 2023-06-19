import 'package:flutter/material.dart';

import '../../../../../../../../ui/box_text.dart';
import '../molecules/sellect_with_icon.dart';

class CardSellectWithIcon extends StatelessWidget {
  final List<SelectWithIconParams> listOfSelectWithIconParams;
  final String title;

  const CardSellectWithIcon({
    Key? key,
    required this.title,
    required this.listOfSelectWithIconParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BoxText.subheadingThree(
          color: Colors.black,
          title,
        ),
        ListView.builder(
          key: UniqueKey(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOfSelectWithIconParams.length,
          itemBuilder: (context, index) {
            SelectWithIconParams selectWithIconParams =
                listOfSelectWithIconParams[index];
            return SellectWithIcon(
              selectWithIconParams: selectWithIconParams,
            );
          },
        ),
      ],
    );
  }
}
