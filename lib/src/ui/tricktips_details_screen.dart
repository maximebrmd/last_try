import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/trickTips_model.dart';

class TrickTipsDetailsScreen extends StatelessWidget {
  final TrickTipsModel trickTips;

  const TrickTipsDetailsScreen({Key key, this.trickTips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(trickTips.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Category" + describeEnum(trickTips.category.toString()),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          /*_buildDetails(context),
          _buildFavoriteButton(context)*/
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Image.memory(
      base64Decode(trickTips.thumbnail),
      fit: BoxFit.cover,
      height: 200,
      width: double.maxFinite,
      alignment: Alignment.center,
    );
  }
}
