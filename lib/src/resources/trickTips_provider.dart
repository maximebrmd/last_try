import 'dart:async';
import 'package:http/http.dart' show Client;
//import 'package:translator/translator.dart';
import 'dart:convert';
import '../models/trickTips_model.dart';

class TrickTipsProvider {
  // TODO : Translator Global
  // final _translator = GoogleTranslator();
  List<TrickTipsModel> _trickTips;
  Client client = Client();

  Future<List<TrickTipsModel>> fetchTrickTipsList() async {
    // TODO : Setup URL for Prod & Dev
    final response = await client.get("http://localhost:8080/trickTips");
    print(response.body.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map i in data) {
        _trickTips.add(TrickTipsModel.fromJson(i));
      }

      // TODO : Use translate trickTips fields : https://github.com/gabrielpacheco23/google-translator/blob/master/example/main.dart
      return _trickTips;
    } else {
      throw Exception('Failed to load trickTips');
    }
  }
}
