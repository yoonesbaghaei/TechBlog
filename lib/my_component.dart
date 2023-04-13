
import 'package:flutter/material.dart';
import '../colors.dart';

class ThecDivider extends StatelessWidget {
  const ThecDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.dividerColor,
      indent: size.width/5,
      endIndent: size.width/5,
      thickness: 0.8,
    );
  }
}
