import 'package:flutter/material.dart';
import 'package:last_try/src/blocs/bloc_provider.dart';
import 'package:last_try/src/blocs/trickTips_bloc.dart';
import 'package:last_try/src/ui/tricktips_tile.dart';
import 'package:last_try/src/ui/widgets/app_bar.dart';
import 'package:last_try/src/ui/widgets/gradient_icon.dart';
import '../models/trickTips_model.dart';

class TrickTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _trickTipsBloc = BlocProvider.of<TrickTipsBloc>(context);

    _trickTipsBloc.fetchAllTrickTips();
    return StreamBuilder<List<TrickTipsModel>>(
        stream: _trickTipsBloc.trickTipsStream,
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
    final _trickTipsBloc = BlocProvider.of<TrickTipsBloc>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: MainAppBar(
        title: "Shaynn",
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 238, 238, 238),
                suffixIcon: GradientIcon(
                  Icons.search,
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: 'Search a trick',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 165, 168, 177),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 15, right: 15, top: 15),
              ),
              onChanged: (title) => _trickTipsBloc.fetchTrickTipsByTitle(title),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => Divider(
                      color: Colors.transparent,
                    ),
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
