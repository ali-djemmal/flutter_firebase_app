import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in anom
 Future signInAnon() async {
   try {
     AuthResult result =await auth.signInAnonymously();
     FirebaseUser user = result.user;
     return user;

   } catch(e){
     print('error :$e');
     return null;
   }
 }

  // sign in with email & password

  //register with email & password

  // sign out




}