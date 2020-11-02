import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  User get user => firebaseAuth.currentUser;

  //Google sign in
  Future<User> googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credentials);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  // //Facebook sign in
  final _facebookLogin = FacebookLogin();
  Future<User> facebookSignIn() async {
    try {
      
      final result = await _facebookLogin.logIn(['email']);
print('facebook login access token: ${result.accessToken}');
print('facebook login error message: ${result.errorMessage}');
print('facebook login status: ${result.status}');
 switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('CANCELED BY USER');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
      // if (result.status == FacebookLoginStatus.loggedIn) {
      //   print('facebook login result status: ${result.status}');
      //   print('facebook login result: ${result.toString()}');
      //   final AuthCredential credential =
      //       FacebookAuthProvider.credential(result.accessToken.token);

      //   UserCredential userCredential =
      //       await firebaseAuth.signInWithCredential(credential);
      //   print('user credential: ${userCredential.user.displayName}');
      //   return userCredential.user;
      // }
      return null;
    } on FirebaseAuthException catch (e) {
      print('facebook error: ${e.message}');
      return null;
    }
  }

  Future<User> registerUserWithEmailAndPassword(
      {String displayName, String email, String password}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user.updateProfile(displayName: displayName);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Firebase exception: ${e.message}';
      throw e;
    }
  }

  Future<User> loginWithEmailAndPassword(
      {String email, String password}) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> logout() async {
    return await firebaseAuth.signOut();
  }
}
