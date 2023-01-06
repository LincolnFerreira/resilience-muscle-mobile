// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/repositories/sign_in_repository.dart';
import '../datasources/remote/firebase/sign_in_datasource_firebase_imp.dart';

class SignInRepositoryImp implements SignInRepository {
  final SignInDataSourceFirebaseImp signInDataSourceFireBaseImp;

  SignInRepositoryImp({
    required this.signInDataSourceFireBaseImp,
  });

  @override
  Future<void> signIn(String email, String password) async {
    print('repository');
    signInDataSourceFireBaseImp.signIn(email, password);
  }
}
