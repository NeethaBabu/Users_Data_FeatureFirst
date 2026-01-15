import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_data_using_fetaure_first/feature/users_data/data/repository/user_repository.dart';

import '../../data/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UserEvent>((event, emit) async{
     emit(UserLoading());
     try{
       final users = await userRepository.fetchUserData();
       emit(UserLoaded(users));
     }catch(e){
       emit(UserError(e.toString()));
     }
    });
  }
}
