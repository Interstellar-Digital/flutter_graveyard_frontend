import 'package:flutter/material.dart';

class GraveButtons extends StatelessWidget {
  const GraveButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Remove Plot/Grave'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add Plot/Grave'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Update Price'),
        ),
      ],
    );
  }
}
