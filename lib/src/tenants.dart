import 'dart:convert';

import 'package:http/http.dart' as http;

import 'inner_http_client.dart';
import 'url_const.dart';

class Tenants {
  final InnerHttpClient _client;

  Tenants(this._client);

  Future<List<String>> list() async {
    http.Response response = await _client.get(UrlConst.tenants);
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tenants');
    }
  }
}