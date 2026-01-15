import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/user_details_model.dart';
import '../../data/repository/user_detail_repository.dart';

part 'user_data_event.dart';

part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserDetailRepository userDetailRepository;

  UserDataBloc(this.userDetailRepository) : super(UserDetailsDataInitial()) {
    on<UserDataEvent>((event, emit) async {
      emit(UserDetailsDataLoading());
      try {
        final usersDetails = await userDetailRepository.fetchUserData();
        emit(UserDetailsDataLoaded(usersDetails));
      } catch (e) {
        emit(UserDetailsDataError(e.toString()));
      }
    });
  }
}
