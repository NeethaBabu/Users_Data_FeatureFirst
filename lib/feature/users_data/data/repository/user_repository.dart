import 'package:user_data_using_fetaure_first/feature/users_data/data/data_source/user_remote_datasource.dart';
import '../model/user_model.dart';

class UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepository(this.userRemoteDatasource);

  Future<List<UserModel>> fetchUserData() {
    return userRemoteDatasource.getUserData();
  }
}
