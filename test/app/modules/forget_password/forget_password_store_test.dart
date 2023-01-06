import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/presentation/modules/forget_password/forget_password_store.dart';

void main() {
  late ForgetPasswordStore store;

  setUpAll(() {
    store = ForgetPasswordStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}
