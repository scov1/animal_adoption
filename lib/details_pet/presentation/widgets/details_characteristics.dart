import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class DetailsCharacteristics extends StatelessWidget {
  const DetailsCharacteristics({Key? key, required this.title, this.amount}) : super(key: key);

  final String title;
  final int? amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title),
            const SizedBox(width: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: index < (amount ?? 0)
                            ? context.color.lavanderBg
                            : context.color.grey300,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
