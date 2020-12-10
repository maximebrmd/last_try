import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last_try/src/models/trickTips_model.dart';
import 'package:last_try/src/ui/tricktips_details_screen.dart';

class TrickTipsTile extends StatelessWidget {
  final TrickTipsModel trickTips;

  const TrickTipsTile({
    Key key,
    @required this.trickTips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.memory(
        base64Decode(trickTips.thumbnail),
        fit: BoxFit.cover,
        height: 50,
        width: 50,
        alignment: Alignment.center,
      ),
      title: Text(trickTips.title),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TrickTipsDetailsScreen(trickTips: trickTips),
          ),
        );
      },
    );
  }
}
