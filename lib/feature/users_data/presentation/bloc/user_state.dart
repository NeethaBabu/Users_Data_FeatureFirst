part of 'user_bloc.dart';

abstract class UserState {}

 class UserInitial extends UserState {}
 class UserLoading extends UserState {}
 class UserLoaded extends UserState {
  final List<UserModel>users;
  UserLoaded(this.users);
}
final class UserError extends UserState {
  final String errorMessage;
  UserError(this.errorMessage);
}
