import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/failure.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/entities/user_info_entity.dart';
import '../../../models/user_info_model.dart';
import '../../../models/user_model.dart';
import '../../remote_datasource.dart';

class FirebaseRemoteDataSourceImp implements RemoteDataSource {
  late final FirebaseAuth _auth = FirebaseAuth.instance;
  late final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<Either<Failure, void>> signUp(UserEntity user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
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
      final res = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final updatedUser = UserModel(
        uid: res.user?.uid,
        email: user.email,
        password: user.password,
      );

      return Right(updatedUser);
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
      final bool isSignedIn = _auth.currentUser?.uid != null;
      return Right(isSignedIn);
    } catch (e) {
      return Left(Failure(message: 'Erro ao verificar status de login: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Erro ao tentar sair da conta: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUId() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        return Right(uid);
      }
      return Left(Failure(message: 'Usuário não encontrado'));
    } catch (e) {
      return Left(Failure(message: 'Erro ao obter o ID do usuário: $e'));
    }
  }

//TODO: VERIFICAR UTILIZAÇÃO DESTA FUNÇÃO
  @override
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid) async {
    try {
      final userEntity = UserEntity();
      final tableReference = _firebaseFirestore.collection('users').doc(uid);

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
        print('Formato de email inválido.');
      } else {
        print('Erro ao verificar o email: ${e.message}');
      }
      return const Right(true);
    } catch (e) {
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
      await _auth.createUserWithEmailAndPassword(
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
      final userReference = _firebaseFirestore.collection('users').doc(uid);
      final infoReference = userReference.collection('information').doc(uid);

      if (userInfoEntity.image != null) {
        String imagePath = 'users/$uid/profile.jpg';
        if (userInfoEntity.image is String) {
          await _firebaseStorage
              .ref(imagePath)
              .putFile(File(userInfoEntity.image));
        } else if (userInfoEntity.image is XFile) {
          await _firebaseStorage
              .ref(imagePath)
              .putFile(File(userInfoEntity.image.path));
        }
      }
      final infoSnapshot = await infoReference.get();
      if (infoSnapshot.exists) {
        return const Right(false);
      }
      await infoReference.set({
        'date_of_birth': userInfoEntity.birthDate,
        'height': userInfoEntity.height,
        'name': userInfoEntity.name,
        'weight': userInfoEntity.weight,
        'training_division': userInfoEntity.trainingDivision,
        'fitness_goal': userInfoEntity.fitnessGoals,
      });

      return const Right(true);
    } catch (e) {
      print(e);
      return Left(
        Failure(
            message: 'Erro ao criar coleções de informações do usuário: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isInfoUserCollectionsExists(String uid) async {
    try {
      final userReference = _firebaseFirestore.collection('users').doc(uid);
      final infoReference = userReference.collection('information').doc(uid);
      final infoSnapshot = await infoReference.get();

      if (!infoSnapshot.exists) {
        return const Right(false);
      }

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
              infoReference.collection(subcollection).limit(1).get()));

      final allExist =
          subcollectionsSnapshots.every((snapshot) => snapshot.docs.isNotEmpty);

      return Right(allExist);
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
      final userReference = _firebaseFirestore.collection('users').doc(uid);
      final infoReference = userReference.collection('information').doc(uid);
      final infoSnapshot = await infoReference.get();

      if (!infoSnapshot.exists) {
        return Left(Failure(message: 'Usuário não encontrado'));
      }

      final data = infoSnapshot.data() as Map<String, dynamic>;

      final profileImageRef =
          _firebaseStorage.ref().child('users/$uid/profile.jpg');
      final getProfileImage = await profileImageRef.getDownloadURL();

      final userInfo = UserInfoModel(
        birthDate: (data['date_of_birth'] as Timestamp).toDate(),
        fitnessGoals: data['fitness_goals'],
        height: data['height'],
        image: getProfileImage,
        name: data['name'],
        trainingDivision: data['training_division'],
        weight: data['weight'],
      );

      print('usuário atual: ${getProfileImage}');

      return Right(userInfo);
    } catch (e) {
      return Left(
          Failure(message: 'Erro ao tentar pegar informações de usuário: $e'));
    }
  }
}
