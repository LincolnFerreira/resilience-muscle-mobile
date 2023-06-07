import 'package:flutter/material.dart';

class SellectWithIcon extends StatelessWidget {
  final SelectWithIconParams selectWithIconParams;

  const SellectWithIcon({
    super.key,
    required this.selectWithIconParams,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InkWell(
        onTap: selectWithIconParams.onTap,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(selectWithIconParams.iconSellect),
                  Text(selectWithIconParams.textSellect)
                ],
              ),
              const Icon(Icons.arrow_forward_ios)
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

  SelectWithIconParams({
    required this.iconSellect,
    required this.textSellect,
    required this.onTap,
  });
}
