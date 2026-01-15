import 'package:user_data_using_fetaure_first/core/network/dio_client.dart';

import '../model/user_model.dart';

class UserRemoteDatasource {
  Future<List<UserModel>> getUserData() async{
    final response = await DioClient.dio.get('/users');
    final List users = response.data['users'];
    print("users in data source:$users");
    return users.map((e)=>UserModel.fromJson(e)).toList();
  }
}