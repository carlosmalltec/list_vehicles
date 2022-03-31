import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String? make;
  final String? version;
  final List<TextSpan>? textSpan;

  const CardTitle({Key? key, this.make, this.version, this.textSpan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: make.toString(),
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          children: textSpan,
        ),
      ),
      subtitle: Visibility(
        visible: version != null,
        child: Text(
          version.toString(),
          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black.withOpacity(0.6), fontSize: 15),
        ),
      ),
    );
  }
}
