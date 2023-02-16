import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotAtom extends StatelessWidget {
  final int count;
  final int activeIndex;
  const DotAtom({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
      ),
    );
  }
}
