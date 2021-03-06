import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_coffee/models/user.dart';
import 'package:flutter_app_coffee/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // craete user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user ){
    return user != null ? User(uid:user.uid)  : null;
  }

 // auth changes user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user)=> _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser); same
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
  Future signInWithEmailAndPassword(String email , String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }
  //register with email & password
  Future registerWithEmailAndPassword(String email , String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(email);
      FirebaseUser user = result.user;
      // create a document for user with id
      await DatabaseService(uid:user.uid).updateUserData('0', 100, 'user1');

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();

    }  catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return null ;

    }
  }





}