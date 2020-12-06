import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/trickTips_model.dart';

class TrickTipsBloc {
  final _repository = Repository();
  final _trickTipsFetcher = PublishSubject<List<TrickTipsModel>>();

  Stream<List<TrickTipsModel>> get allTrickTips => _trickTipsFetcher.stream;

  fetchAllTrickTips() async {
    List<TrickTipsModel> trickTipsModel = await _repository.fetchAllTrickTips();
    _trickTipsFetcher.sink.add(trickTipsModel);
  }

  dispose() {
    _trickTipsFetcher.close();
  }
}

final trickTipsBloc = TrickTipsBloc();
