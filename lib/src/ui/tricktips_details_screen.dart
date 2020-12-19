import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last_try/src/ui/widgets/app_bar_return.dart';
import 'package:last_try/src/ui/widgets/shadow_button.dart';
import '../models/trickTips_model.dart';

class TrickTipsDetailsScreen extends StatelessWidget {
  final TrickTipsModel trickTips;

  const TrickTipsDetailsScreen({Key key, this.trickTips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ReturnAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  transform: Matrix4.translationValues(0.0, 100.0, 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: _buildTricksDetails(context),
                ),
                _buildBanner(context),
                _buildFavoriteButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: Image.memory(
          base64Decode(trickTips.thumbnail),
          fit: BoxFit.cover,
          height: 300,
          width: double.maxFinite,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
          transform: Matrix4.translationValues(0.0, 12.0, 0.0),
          alignment: FractionalOffset.center,
          child: ShadowIconButton(
            backgroundColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            icon: Icons
                .favorite_border, // Icons.favorite = true, Icons.favorite_border = false
            iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            onPressed: (context) => {print("Call API to insert user favorite")},
          ),
        ),
      ],
    );
  }

  Widget _buildTricksDetails(context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Row(
            children: [
              Text(
                trickTips.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(2, 2),
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).primaryColor,
                              Color.fromARGB(255, 115, 100, 241)
                            ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      describeEnum(trickTips.category.toString()),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(2, 2),
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).primaryColor,
                              Color.fromARGB(255, 115, 100, 241)
                            ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      describeEnum(trickTips.level.toString()),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ],
    );
  }
}
