import 'package:flutter/material.dart';
import '../models/trickTips_model.dart';
import '../blocs/trickTips_bloc.dart';

class TrickTipsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    trickTipsBloc.fetchAllTrickTips();
    return Scaffold(
      appBar: AppBar(
        title: Text('TrickTips'),
      ),
      body: StreamBuilder(
        stream: trickTipsBloc.allTrickTips,
        builder: (context, AsyncSnapshot<List<TrickTipsModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<TrickTipsModel>> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Text(snapshot.data[index].title);
        });
  }
}
