import 'package:flutter/material.dart';
import 'package:last_try/src/blocs/bloc_provider.dart';
import 'package:last_try/src/blocs/trickTips_bloc.dart';
import 'package:last_try/src/ui/tricktips_tile.dart';
import 'package:last_try/src/ui/widgets/app_bar.dart';
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
            return _buildTrickTipsList(context, snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildTrickTipsList(
      BuildContext context, AsyncSnapshot<List<TrickTipsModel>> snapshot) {
    return newMethod(context, snapshot);
  }

  Scaffold newMethod(
      BuildContext context, AsyncSnapshot<List<TrickTipsModel>> snapshot) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: MainAppBar(
        title: "Shaynn",
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
