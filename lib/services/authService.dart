import 'package:firebase_auth/firebase_auth.dart';
import 'package:moch/models/user.dart';

class AuthService {
  //this is the instannce from firebase auth annon login enabled in firebase website
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //using User custome model to change return value firebaseUser instead of its default
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //this function determines if user has logged in or logout automatically
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future signInAnon() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser firebaseUser = authResult.user;
      _userFromFirebase(firebaseUser);

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      //signOut method is built in by firebase so dont get confused
      return await _auth.signOut();
    }catch(e){

    }
  }
}
