import 'package:user_data_using_fetaure_first/core/network/dio_client.dart';
import 'package:user_data_using_fetaure_first/feature/details_listing/data/model/user_details_model.dart';

class UserDetailsDatasource {
Future<List<UserDataModel>> getUserDetails()async{
  final response = await DioClient.dio.get('/users');
  final List users = response.data['users'];
  return users.map((e)=>UserDataModel.fromJson(e)).toList();
}
}