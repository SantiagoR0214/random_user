import 'package:loggy/loggy.dart';
import '../../domain/repositories/iuserrepository.dart';
import '../datasources/local/user_local_datasource.dart';
import '../datasources/remote/user_remote_datasource.dart';
import '../../domain/entities/random_user.dart';

class UserRepository implements IUserRepository {
  late UserRemoteDatatasource remoteDataSource;
  late UserLocalDataSource localDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
    remoteDataSource = UserRemoteDatatasource();
    localDataSource = UserLocalDataSource();
  }

  @override
  Future<void> deleteAll() async {
    // TODO: implement deleteAll
    await localDataSource.deleteAll();
  }

  @override
  Future<void> deleteUser(id) async {
    // TODO: implement deleteUser
    await localDataSource.deleteUser(id);
  }

  @override
  Future<List<RandomUser>> getAllUsers() async{
    // TODO: implement getAllUsers
    return await localDataSource.getAllUsers();
  }

  @override
  Future<bool> getUser() async {
    RandomUser user = await remoteDataSource.getUser();
    await localDataSource.addUser(user);
    return true;
  }

  @override
  Future<void> updateUser(user) async {
    // TODO: implement updateUser
    await localDataSource.updateUser(user);
  }
}
