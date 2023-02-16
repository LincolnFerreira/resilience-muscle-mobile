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
  Future<Either<Failure, void>> signIn(UserEntity user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      // print('datasource sucesso');
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Failure(message: 'Usuário não encontrado!'));
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Left(Failure(message: 'Senha incorreta!'));
        // print('Wrong password provided for that user.');
      }
    }
    return const Right(null);
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
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firestore.collection('users');

    final uid = await userCollectionRef.doc(user.uid).get().then((value) async {
      final newUser = UserModel(
        uid: await getCurrentUId(),
        name: user.name,
        email: user.email,
        password: user.password,
      );
      if (!value.exists) {
        await userCollectionRef.doc(newUser.uid).set({
          newUser.uid: await getCurrentUId(),
          newUser.name: user.name,
          newUser.email: user.email,
          newUser.password: user.password,
        });
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;
}
