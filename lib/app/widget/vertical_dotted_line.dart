import 'package:flutter/material.dart';

class VerticalDottedLine extends StatelessWidget {
  const VerticalDottedLine({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < height / 4; i++)
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Colors.grey,
              height: 2,
              width: 2,
            ),
          )
      ],
    );
  }
}
