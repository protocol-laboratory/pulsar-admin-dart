import 'dart:convert';

import 'package:http/http.dart' as http;

import 'inner_http_client.dart';
import 'url_const.dart';

class Namespaces {
  final InnerHttpClient _client;

  Namespaces(this._client);

  Future<List<String>> list(String tenant) async {
    http.Response response = await _client.get("${UrlConst.namespaces}/$tenant");
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tenants');
    }
  }
}
