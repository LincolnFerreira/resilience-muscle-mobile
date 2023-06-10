import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/failure.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../models/user_model.dart';
import '../../remote_datasource.dart';

class FirebaseRemoteDataSourceImp implements RemoteDataSource {
  late final FirebaseAuth auth = FirebaseAuth.instance;
  late final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, void>> signUp(UserEntity user) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Erro durante o cadastro: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(UserEntity user) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final changeUser = UserModel(
        uid: res.user?.uid,
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
      return Left(Failure(message: 'Erro durante o login: $e'));
    } catch (e) {
      return Left(Failure(message: 'Erro durante o login: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      return Right(auth.currentUser?.uid != null);
    } catch (e) {
      return Left(Failure(message: 'Erro ao verificar status de login: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Erro ao tentar sair da conta: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUId() async {
    try {
      return Right(auth.currentUser!.uid);
    } catch (e) {
      return Left(Failure(message: 'Erro ao obter o ID do usuário: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid) async {
    try {
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
      return Right(userEntity);
    } catch (e) {
      return Left(Failure(message: 'Erro ao obter usuário atual: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailDuplicate(String email) async {
    try {
      final List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (signInMethods.isEmpty) {
        return const Right(false);
      } else {
        return const Right(true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // O formato do email é inválido
        print('Formato de email inválido.');
      } else {
        // Outro erro relacionado ao Firebase Authentication
        print('Erro ao verificar o email: ${e.message}');
      }
      return const Right(true);
    } catch (e) {
      // Outros erros
      print('Erro ao verificar o email: $e');
      return const Right(true);
    }
  }

  @override
  Future<Either<Failure, bool>> createNewUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: 'Erro ao criar novo usuário: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> createCollectionsInfoUser({
    required String name,
    required DateTime birthDate,
    required double height,
    required double weight,
    required String uid,
  }) async {
    try {
      final userEntity = UserEntity();
      final tableReference =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final tableSnapshot = await tableReference.get();
      DateTime data = DateTime.now();
      Timestamp timestamp = Timestamp.fromDate(data);
      if (!tableSnapshot.exists) {
        await tableReference.set({
          'date_of_birth': timestamp,
          'height': 1.63,
          'name': "Lincoln Ferreira",
          'weight': 88,
        });
      } else {
        await tableReference.set({
          'date_of_birth': birthDate,
          'height': height,
          'name': name,
          'weight': weight,
        });
      }
      return const Right(true);
    } catch (e) {
      return Left(Failure(
          message: 'Erro ao criar coleções de informações do usuário: $e'));
    }
  }
}
