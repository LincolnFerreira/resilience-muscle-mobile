import 'package:flutter/material.dart';

import '../../../../../../../../ui/box_text.dart';
import '../../../../../../../../ui/colors.dart';

class SellectWithIcon extends StatefulWidget {
  final SelectWithIconParams selectWithIconParams;

  const SellectWithIcon({
    super.key,
    required this.selectWithIconParams,
  });

  @override
  State<SellectWithIcon> createState() => _SellectWithIconState();
}

class _SellectWithIconState extends State<SellectWithIcon> {
  late bool isActiveSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InkWell(
        onTap: widget.selectWithIconParams.onTap,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.selectWithIconParams.iconSellect),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(widget.selectWithIconParams.textSellect),
                  )
                ],
              ),
              widget.selectWithIconParams.isToggle
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorsUI.whiteGrey,
                            ),
                            color: ColorsUI.whiteGrey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: BoxText.body(
                            'Em breve',
                            color: ColorsUI.white63,
                          ),
                        ),
                        Switch(
                            activeColor: ColorsUI.primary,
                            value: isActiveSwitch,
                            onChanged: (value) => setState(
                                  () => isActiveSwitch = !isActiveSwitch,
                                ))
                      ],
                    )
                  : const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

class SelectWithIconParams {
  final IconData iconSellect;
  final String textSellect;
  final VoidCallback onTap;
  final bool isToggle;

  SelectWithIconParams({
    required this.iconSellect,
    required this.textSellect,
    required this.onTap,
    this.isToggle = false,
  });
}
