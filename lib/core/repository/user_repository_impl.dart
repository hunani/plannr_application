import 'package:get_it/get_it.dart';
import '../network/api_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final repo = GetIt.I.get<ApiClient>();

  // @override
  // Future<List<AddressListData>> signUpVerify() async {
  //   return await repo.signUpVerify();
  // }

}
