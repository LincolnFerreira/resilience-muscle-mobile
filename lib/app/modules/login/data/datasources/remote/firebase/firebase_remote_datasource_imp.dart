// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/failure.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../models/user_model.dart';
import '../../remote_datasource.dart';

class FirebaseRemoteDataSourceImp implements RemoteDataSource {
  late final FirebaseAuth auth = FirebaseAuth.instance;

  late final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> signUp(UserEntity user) async {
    auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(UserEntity user) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      final changeUser = UserModel(
        uid: await getCurrentUId(),
        name: user.name,
        email: user.email,
        password: user.password,
      );

      user = changeUser;
      return Right(changeUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Failure(message: 'Usuário não encontrado!'));
      } else if (e.code == 'wrong-password') {
        return Left(Failure(message: 'Senha incorreta!'));
      }
    }
    return Left(Failure(message: 'Erro desconhecido'));
  }

  @override
  Future<bool> isSignIn() async {
    return auth.currentUser?.uid != null;
  }

  @override
  Future<void> signOut() {
    return auth.signOut();
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<UserEntity> getCurrentUser(String uid) async {
    final userEntity = UserEntity();
    final tableReference =
        FirebaseFirestore.instance.collection('users').doc(uid);

    final tableSnapshot = await tableReference.get();
    DateTime data = DateTime.now();
    Timestamp timestamp = Timestamp.fromDate(data);
    if (!tableSnapshot.exists) {
      await tableReference.set({
        'date_of_birth': timestamp,
        'heigth': 1.63,
        'name': "Lincoln Ferreira",
        'width': 88,
        // adicione os campos e valores necessários para criar a tabela
      });
    } else {
      await tableReference.set({
        'date_of_birth': timestamp,
        'heigth': 1.63,
        'name': "Lincoln Ferreira",
        'width': 88,
        // adicione os campos e valores necessários para criar a tabela
      });
    }
    print('snapshot: ${tableSnapshot.data()}');
    return userEntity;
  }
}
