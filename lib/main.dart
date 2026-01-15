import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/data/data_source/user_remote_datasource.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/data/repository/user_repository.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/presentation/bloc/user_bloc.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/presentation/pages/userPage.dart';

import 'feature/details_listing/data/data_source/user_details_datasource.dart';
import 'feature/details_listing/data/repository/user_detail_repository.dart';
import 'feature/details_listing/presentation/bloc/user_data_bloc.dart';
import 'feature/details_listing/presentation/pages/user_details_listing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(UserRepository(UserRemoteDatasource())),
        ),
        BlocProvider(
          create: (context) => UserDataBloc(UserDetailRepository(UserDetailsDatasource())),
        ),
      ],
      child: MaterialApp(
        home: const UserDetailsListing(),
      ),
    );
  }
}
