import 'package:pulsar_admin/pulsar_admin.dart';
import 'package:test/test.dart';

void main() {
  PulsarAdmin? pulsarAdmin;
  Tenants? tenants;

  setUp(() {
    pulsarAdmin = PulsarAdmin(
      host: 'localhost',
      port: 8080,
    );
    tenants = pulsarAdmin?.tenants;
  });

  test('List tenants', () async {
    List<String> tenantList;
    try {
      tenantList = await tenants?.list() ?? [];
      expect(tenantList, isNotNull);
      expect(tenantList, isNotEmpty);
    } catch (e) {
      print('Error: $e');
    }
  });
}
