import 'dart:io';

import 'inner_http_client.dart';
import 'namespaces.dart';
import 'tenants.dart';

class PulsarAdmin {
  late final String baseUrl;
  late final Tenants tenants;
  late final Namespaces namespaces;

  PulsarAdmin({
    required String host,
    required int port,
    bool useSSL = false,
    SecurityContext? securityContext,
  }) {
    String protocol = useSSL ? 'https' : 'http';
    baseUrl = '$protocol://$host:$port';
    final client = InnerHttpClient(baseUrl, useSSL, securityContext);
    tenants = Tenants(client);
    namespaces = Namespaces(client);
  }
}
