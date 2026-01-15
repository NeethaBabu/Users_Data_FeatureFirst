part of 'user_data_bloc.dart';

abstract class UserDataState {}

class UserDetailsDataInitial extends UserDataState {}

class UserDetailsDataLoading extends UserDataState {}

class UserDetailsDataLoaded extends UserDataState {
  final List<UserDataModel> users;

  UserDetailsDataLoaded(this.users);
}

class UserDetailsDataError extends UserDataState {
  final String errorDataMessage;

  UserDetailsDataError(this.errorDataMessage);
}
