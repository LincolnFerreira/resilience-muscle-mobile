import 'package:flutter/material.dart';

class OrAtom extends StatelessWidget {
  const OrAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Text(
              ' or ',
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
