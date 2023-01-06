import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/splash_store.dart';

void main() {
  late SplashStore store;

  setUpAll(() {
    store = SplashStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
