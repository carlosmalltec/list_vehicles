import 'package:appvehicles/constants/const_colors.dart';
import 'package:flutter/material.dart';

class ApplicationButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double width;
  final double height;
  const ApplicationButton({
    Key? key,
    this.onPressed,
    this.backgroundColor = ConstColors.blue,
    this.child,
    this.padding,
    this.elevation = 0,
    this.width = 88.0,
    this.height = 36.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      padding: padding,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor), elevation: MaterialStateProperty.all(elevation)),
          onPressed: onPressed,
          child: child ?? Container(),
        ),
      ),
    );
  }
}
