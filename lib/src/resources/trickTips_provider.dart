import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:translator/translator.dart';
import 'dart:convert';
import '../models/trickTips_model.dart';

class TrickTipsProvider {
  http.Client client = http.Client();

  Future<List<TrickTipsModel>> fetchAllTrickTips(
      Map<String, String> params) async {
    final headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    };

    Uri uri = Uri.parse("http://10.0.2.2:8080/api/v1.0/trickTips/");

    uri = uri.replace(queryParameters: params);

    final response = await http.get(uri, headers: headers);

    return parseResponse(response);
  }

  List<TrickTipsModel> parseResponse(http.Response response) {
    List<TrickTipsModel> _trickTips = new List<TrickTipsModel>();

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
