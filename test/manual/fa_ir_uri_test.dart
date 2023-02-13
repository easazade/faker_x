import 'package:fake_it/fake_it.dart';
import 'package:fake_it/src/locales/global/datasources/internet.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test("fa_ir -> internet -> uri test", () async {
    assertFakeValue(FakeIt.localized.en_us.internet.uri(UriArgs('ftp')));
    assertFakeValue(FakeIt.localized.en_us.internet.uri(UriArgs('https')));
  });
}
