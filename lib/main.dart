import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myFlutterApp/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'blocs/user_bloc/allowed_states_bloc/user_cubit.dart';
import 'screens/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(
            repository: UserRepository(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}
