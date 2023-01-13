import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';
import 'package:resilience_muscle/app/data/models/user_model.dart';
import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImp implements FirebaseRemoteDataSource {
  late final FirebaseAuth auth = FirebaseAuth.instance;

  late final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> signUp(UserEntity user) async {
    auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      // print('datasource sucesso');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
      }
    }
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
      // ignore: unused_local_variable
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
