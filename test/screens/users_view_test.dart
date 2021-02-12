import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:myFlutterApp/provider/user_provider.dart';
import 'package:myFlutterApp/screens/users_view.dart';
import 'package:myFlutterApp/service/user_service.dart';
import 'package:myFlutterApp/util/make_testable.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import 'package:provider/provider.dart';

void main() {
  group('UsersView Test', () {
    setUp(() {
      GetIt.I.registerLazySingleton(() => UserService());
    });
    testWidgets('Displays Title text', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        Provider(
          value: UserProvider.initializeUsersList(),
          child: MakeTestable.returnTestableWidget(
            UsersView(),
          ),
        ),
      );
      expect(find.widgetWithText(PageTitleText, 'U.M.S'), findsOneWidget);
    });
  });
}
