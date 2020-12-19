import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  MainAppBar({
    Key key,
    @required this.title,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Good morning,\n",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: title,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: IconButton(
              icon: GradientIcon(
                Icons.short_text,
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
              onPressed: () {
                // open nav menu (profil, setting & log out)
              },
            ),
          ),
        ],
      ),
    );
  }
}
