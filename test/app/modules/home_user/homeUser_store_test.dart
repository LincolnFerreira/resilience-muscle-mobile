import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/presentation/modules/home_user/home_user_store.dart';

void main() {
  late HomeUserStore store;

  setUpAll(() {
    store = HomeUserStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
