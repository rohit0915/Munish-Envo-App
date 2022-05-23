import 'package:flutter/material.dart';

class StartStopWidget extends StatelessWidget {
  const StartStopWidget({Key? key, required this.distance}) : super(key: key);
  final double distance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 6,
              width: 6,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        for (int i = 0; i < distance; i++)
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 2,
              width: 2,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 6,
              width: 6,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}
