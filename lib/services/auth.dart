import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_coffee/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // craete user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user ){
    return user != null ? User(uid:user.uid)  : null;
  }





  // sign in anom
 Future signInAnon() async {
   try {
     AuthResult result =await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user);

   } on AuthException catch  (e) {
     print('Failed with error code: ${e.code}');
     print(e.message);
   }
 }

  // sign in with email & password

  //register with email & password

  // sign out




}