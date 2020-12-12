import 'package:flutter/material.dart';
import 'package:last_try/src/ui/widgets/shadow_button.dart';

class ReturnAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  ReturnAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            transform: Matrix4.translationValues(10, 10.0, 0),
            child: ShadowIconButton(
              backgroundColor: Colors.white,
              iconColor: Theme.of(context).primaryColor,
              icon: Icons.arrow_back_ios,
              iconPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              onPressed: (context) => {
                Navigator.of(context).pop(),
              },
            ),
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          )),
    );
  }
}
