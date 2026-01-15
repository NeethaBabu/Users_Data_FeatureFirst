import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_data_bloc.dart';

class UserDetailsListing extends StatefulWidget {
  const UserDetailsListing({super.key});

  @override
  State<UserDetailsListing> createState() => _UserDetailsListingState();
}

class _UserDetailsListingState extends State<UserDetailsListing> {
  @override
  void initState() {
    super.initState();
    context.read<UserDataBloc>().add(FetchUserDetails());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UserDetailsListing"),),
      body: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          if(state is UserDetailsDataLoading){
            return Center(child: CircularProgressIndicator(),);
          }if(state is UserDetailsDataLoaded){
           return  ListView.separated(itemBuilder: (context, index) {
             return ListTile(
               leading: CircleAvatar(
                 backgroundImage: NetworkImage(state.users[index].image),),
               title: Text(state.users[index].firstName),
               subtitle: Text(state.users[index].email),
             );
           },
               separatorBuilder: (_, __) => const SizedBox(height: 10),
               itemCount: 3);
          }if(state is UserDetailsDataError){
            return Center(child: Text(state.errorDataMessage),);
          }
          return SizedBox();
        },
      ),
    );
  }
}
