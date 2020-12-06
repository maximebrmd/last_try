import 'dart:async';

// Import providers
import 'trickTips_provider.dart';

// Import models
import '../models/trickTips_model.dart';

class Repository {
  final trickTipsProvider = TrickTipsProvider();

  Future<List<TrickTipsModel>> fetchAllTrickTips() =>
      trickTipsProvider.fetchTrickTipsList();
}
