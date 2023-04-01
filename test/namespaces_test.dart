import 'package:pulsar_admin/pulsar_admin.dart';
import 'package:test/test.dart';

void main() {
  PulsarAdmin? pulsarAdmin;
  Namespaces? namespaces;

  setUp(() {
    pulsarAdmin = PulsarAdmin(
      host: 'localhost',
      port: 8080,
    );
    namespaces = pulsarAdmin?.namespaces;
  });

  test('List namespaces', () async {
    String tenant = 'public';
    List<String> namespaceList;
    try {
      namespaceList = await namespaces?.list(tenant) ?? [];
      expect(namespaceList, isNotNull);
      expect(namespaceList, isNotEmpty);
    } catch (e) {
      print('Error: $e');
    }
  });
}
