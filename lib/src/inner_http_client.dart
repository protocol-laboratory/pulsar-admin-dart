import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;

class InnerHttpClient {
  final http.Client _inner;
  final String basePath;
  final bool useSSL;
  final SecurityContext? securityContext;

  InnerHttpClient(this.basePath, this.useSSL, this.securityContext)
      : _inner =
            http_io.IOClient(HttpClient(context: securityContext)..badCertificateCallback = (cert, host, port) => true);

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    final requestUrl = Uri.parse(basePath + url);
    return _inner.get(requestUrl, headers: headers);
  }
}
