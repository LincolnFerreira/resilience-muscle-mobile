import 'package:firebase_auth/firebase_auth.dart';
import 'package:resilience_muscle/app/data/datasources/sign_in_datasource.dart';

class SignInDataSourceFirebaseImp implements SignInDataSource {
  // SignInDataSourceFirebaseImp(this.auth, this.firestore);

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // print('datasource sucesso');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
      }
    }
  }
}
