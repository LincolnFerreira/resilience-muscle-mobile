import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resilience_muscle/app/modules/login/data/models/user_info_model.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

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
      return Left(Failure(message: 'Erro durante o login'));
    } catch (e) {
      return Left(Failure(message: 'Erro durante o login'));
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      final bool res = auth.currentUser?.uid != null;

      return Right(res);
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
      final String? res = auth.currentUser?.uid;
      if (res != null) {
        return Right(res);
      }
      return Left(Failure(message: 'Usuário não encontrado'));
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
    required UserInfoEntity userInfoEntity,
    required String uid,
  }) async {
    try {
      final tableReferenceUser =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final tableReferenceInfo =
          tableReferenceUser.collection('information').doc(uid);
      final tableSnapshot = await tableReferenceInfo.get();

      if (!tableSnapshot.exists) {
        await tableReferenceInfo.set({
          'date_of_birth': userInfoEntity.birthDate,
          'height': userInfoEntity.height,
          'name': userInfoEntity.name,
          'weight': userInfoEntity.weight,
          'training_division': userInfoEntity.trainingDivision,
          'fitness_goal': userInfoEntity.fitnessGoals
        });
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return Left(
        Failure(
            message: 'Erro ao criar coleções de informações do usuário: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isInfoUserCollectionsExists(String uid) async {
    try {
      final tableReferenceUser =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final tableReferenceInfo =
          tableReferenceUser.collection('information').doc(uid);
      final documentInfo = await tableReferenceInfo.get();

      if (documentInfo.exists) {
        final subcollections = [
          'date_of_birth',
          'fitness_goals',
          'height',
          'image',
          'name',
          'training_division',
          'weight'
        ];

        final subcollectionsSnapshots = await Future.wait(subcollections.map(
            (subcollection) =>
                tableReferenceInfo.collection(subcollection).limit(1).get()));

        final allExist = subcollectionsSnapshots
            .every((snapshot) => snapshot.docs.isNotEmpty);

        return Right(allExist);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(
        Failure(
            message:
                'Erro ao verificar a existência das coleções de informações do usuário: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, UserInfoEntity>> getInfoUser(String uid) async {
    try {
      final tableReferenceUser =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final tableReferenceInfo =
          tableReferenceUser.collection('information').doc(uid);
      final tableSnapshot = await tableReferenceInfo.get();

      final data = tableSnapshot.data() as Map<String, dynamic>;

      final userInfo = UserInfoModel(
        birthDate: (data['date_of_birth'] as Timestamp).toDate(),
        fitnessGoals: data['fitness_goals'],
        height: data['height'],
        image: data['image'],
        name: data['name'],
        trainingDivision: data['training_division'],
        weight: data['weight'],
      );

      return Right(userInfo);
    } catch (e) {
      return Left(
          Failure(message: 'Erro ao tentar pegar infomações de usuário'));
    }
  }
}
