import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myFlutterApp/blocs/user_bloc/allowed_states_bloc/user_cubit.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/screens/user_details.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:myFlutterApp/widgets/delete_user_widget.dart';
import 'package:myFlutterApp/widgets/loading_widget.dart';
import '../blocs/user_bloc/allowed_states_bloc/user_cubit_state.dart';
import '../util/change_screen.dart';
import '../util/toast_message.dart';

class UserWidget extends StatefulWidget {
  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  List<User> users = [];

  @override
  void initState() {
    context.read<UserCubit>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserCubitState>(listener: (ctx, state) {
      if (state is ErrorState) {
        showSnackBar(context, '${state.message}', error: true);
      }
      if (state is SuccessState) {
        users.clear();
        if (state.response != null && state.response!.items != null) {
          users.addAll(state.response!.items!);
        }
        print(state.response);
      }
    }, builder: (context, state) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: state is LoadingState
            ? LoadingWidget()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: users.length,
                itemBuilder: (context, index) => Card(
                  child: Dismissible(
                    key: ValueKey(users[index].id),
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (direction) async => await showDialog(
                      context: context,
                      builder: (_) => DeleteUser(),
                    ),
                    onDismissed: (direction) {},
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(left: 16),
                      child: Align(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    child: ListTile(
                      title: CustomText(text: '${users[index].userName}'),
                      subtitle: Text('${users[index].profileUrl}'),
                      leading: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage('${users[index].profileImage}'),
                          ),
                        ),
                      ),
                      onTap: () => ChangeScreen.changeScreen(
                        context,
                        DetailScreen(detailedUser: users[index]),
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
