import 'package:appvehicles/constants/const_colors.dart';
import 'package:flutter/material.dart';

class CardTags extends StatelessWidget {
  final String? title;
  const CardTags({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: ConstColors.placeholder, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title.toString(),
        style: Theme.of(context).textTheme.subtitle2?.copyWith(fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
