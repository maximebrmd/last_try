import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last_try/src/models/trickTips_model.dart';
import 'package:last_try/src/ui/tricktips_details_screen.dart';
import 'package:last_try/src/ui/widgets/gradient_icon.dart';

class TrickTipsTile extends StatelessWidget {
  final TrickTipsModel trickTips;

  const TrickTipsTile({
    Key key,
    @required this.trickTips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(1, 1),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.memory(
            base64Decode(trickTips.thumbnail),
            fit: BoxFit.cover,
            height: 50,
            width: 50,
            alignment: Alignment.center,
          ),
        ),
        title: Text(trickTips.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        trailing: GradientIcon(
          Icons.keyboard_arrow_right,
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
        /*subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(describeEnum(trickTips.category.toString()),
                style: TextStyle(color: Colors.black)),
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(describeEnum(trickTips.level.toString()),
                style: TextStyle(color: Colors.black)),
          ],
        ),*/
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  TrickTipsDetailsScreen(trickTips: trickTips),
            ),
          );
        },
      ),
    );
  }
}
