import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../l10n/generated/l10n.dart';

class DetailsMainSection extends StatelessWidget {
  const DetailsMainSection({
    Key? key,
    required this.origin,
    required this.metric,
    required this.natural,
  }) : super(key: key);

  final String? origin;
  final String? metric;
  final int? natural;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: context.color.accent,
          ),
          child: Text(
            natural == 0 ? S.of(context).male : S.of(context).female,
            style: context.text.s14w400,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: context.color.accent,
          ),
          child: Text(
            origin ?? 'USA',
            style: context.text.s14w400,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: context.color.accent,
          ),
          child: Text(
            '> ${metric?.split(' - ')[1]} kg',
            style: context.text.s14w400,
          ),
        ),
      ],
    );
  }
}
