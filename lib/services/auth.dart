import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in anom
 Future signInAnon() async {
   try {
     AuthResult result =await auth.signInAnonymously();
     FirebaseUser user = result.user;
     return user;

   } on AuthException catch  (e) {
     print('Failed with error code: ${e.code}');
     print(e.message);
   }
 }

  // sign in with email & password

  //register with email & password

  // sign out




}