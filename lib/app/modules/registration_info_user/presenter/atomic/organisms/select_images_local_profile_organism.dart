// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SelectImagesLocalProfileOrganism extends StatelessWidget {
  final List<String> assetsCollection;

  const SelectImagesLocalProfileOrganism({
    Key? key,
    required this.assetsCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        ListView.builder(
          itemCount: assetsCollection.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 90,
              height: 90,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(assetsCollection[index]),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
