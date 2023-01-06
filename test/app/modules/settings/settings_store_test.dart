import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/presentation/modules/settings/settings_store.dart';

void main() {
  late SettingsStore store;

  setUpAll(() {
    store = SettingsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
