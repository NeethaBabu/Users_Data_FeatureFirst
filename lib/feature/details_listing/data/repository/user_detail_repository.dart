import 'package:user_data_using_fetaure_first/feature/details_listing/data/model/user_details_model.dart';

import '../data_source/user_details_datasource.dart';

class UserDetailRepository {
  final UserDetailsDatasource userDetailsDatasource;
  UserDetailRepository(this.userDetailsDatasource);
  Future<List<UserDataModel>> fetchUserData(){
    return userDetailsDatasource.getUserDetails();
  }
}