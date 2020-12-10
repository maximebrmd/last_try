import 'package:flutter/material.dart';
import 'package:last_try/src/blocs/bloc_provider.dart';
import 'package:last_try/src/blocs/trickTips_bloc.dart';
import 'package:last_try/src/ui/tricktips_tile.dart';
import '../models/trickTips_model.dart';

class TrickTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TrickTipsBloc>(context);

    bloc.fetchAllTrickTips();
    return StreamBuilder<List<TrickTipsModel>>(
        stream: bloc.trickTipsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildTrickTipsList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildTrickTipsList(AsyncSnapshot<List<TrickTipsModel>> snapshot) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trick Tips"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search a trick'),
              //onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  TrickTipsModel trickTips = snapshot.data[index];
                  return TrickTipsTile(trickTips: trickTips);
                }),
          ),
        ],
      ),
    );
  }
}
