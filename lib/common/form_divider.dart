import 'package:flutter/material.dart';

class TDividerForm extends StatelessWidget {
  const TDividerForm({
    super.key,
    required this.isDark, required this.dividerText,
  });

  final bool isDark;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
            color:
                isDark
                    ? const Color(0xFF757575)
                    : const Color(0xFF9E9E9E),
            thickness: 1.0,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color:
                isDark
                    ? const Color(0xFF757575)
                    : const Color(0xFF9E9E9E),
            thickness: 1.0,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}