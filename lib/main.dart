import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myFlutterApp/service/user_service.dart';
import 'package:provider/provider.dart';
import 'screens/my_app.dart';
import 'package:myFlutterApp/provider/user_provider.dart';

void setUpLocator() {
  GetIt.I.registerLazySingleton(() => UserService());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(notifier: UserProvider.initializeUsersList()),
      ],
      child: MyApp(),
    ),
  );
}
