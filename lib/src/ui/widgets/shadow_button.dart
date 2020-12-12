import 'package:flutter/material.dart';
import 'package:last_try/src/ui/widgets/gradient_icon.dart';

class ShadowIconButton extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
  final EdgeInsetsGeometry iconPadding;
  final Function(BuildContext context) onPressed;

  ShadowIconButton(
      {Key key,
      @required this.backgroundColor,
      @required this.iconColor,
      @required this.icon,
      @required this.iconPadding,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(2, 2),
          ),
        ],
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        padding: iconPadding,
        //icon: Icon(icon, color: iconColor),
        icon: GradientIcon(
          icon,
          IconTheme.of(context).size,
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Color.fromARGB(255, 115, 100, 241)
            ],
          ),
        ),
        onPressed: () => onPressed(context),
      ),
    );
  }
}
