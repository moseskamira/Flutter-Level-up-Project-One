import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Driver Test', () {
    FlutterDriver flutterDriver;
    setUpAll(() async {
      flutterDriver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (flutterDriver != null) {
        await flutterDriver.close();
      }
    });
  });
}
