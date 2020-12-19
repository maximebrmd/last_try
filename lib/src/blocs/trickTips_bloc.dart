import 'dart:async';

import '../resources/repository.dart';
import '../models/trickTips_model.dart';
import 'bloc.dart';

class TrickTipsBloc implements Bloc {
  final _repository = Repository();
  final _trickTipsController = StreamController<List<TrickTipsModel>>();

  Stream<List<TrickTipsModel>> get trickTipsStream =>
      _trickTipsController.stream;

  fetchAllTrickTips() async {
    List<TrickTipsModel> _trickTipsModel = List<TrickTipsModel>();

    var params = {"sort": '{"title": 1}'};

    _trickTipsModel = await _repository.fetchAllTrickTips(params);

    _trickTipsController.sink.add(_trickTipsModel);
  }

  fetchTrickTipsByTitle(String title) async {
    List<TrickTipsModel> _trickTipsModel = List<TrickTipsModel>();

    var params = {
      "filters": '{"title": {"\$regex" : "$title", "\$options": "i"} }',
      "sort": '{"title": 1}'
    };

    _trickTipsModel = await _repository.fetchAllTrickTips(params);

    _trickTipsController.sink.add(_trickTipsModel);
  }

  @override
  dispose() {
    _trickTipsController.close();
  }
}
