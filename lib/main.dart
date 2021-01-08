import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/my_app.dart';
import 'package:myFlutterApp/provider/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(notifier: UserProvider.initializeUsersList()),
      ],
      child: MyApp(),
    ),
  );
}
