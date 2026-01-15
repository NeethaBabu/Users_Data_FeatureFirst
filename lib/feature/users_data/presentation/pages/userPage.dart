import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/presentation/bloc/user_bloc.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("User Page")),
        body:
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoading){
             return  Center(child: CircularProgressIndicator());
            }
            if(state is UserLoaded) {
              return ListView.builder(
                itemCount:state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  final users = state.users[index];
                  return ListTile(
                    leading: Text(users.id.toString()),
                    title: Text(users.firstName),
                    trailing: Text(users.emailId),
                  );
                },
              );
            }
            if(state is UserError){
              return  Text(state.errorMessage);
            }
            return SizedBox();
          },
        )
    );
  }
}
