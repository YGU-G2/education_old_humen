import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled2/exceptions/auth_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/models/users.dart';

class FirebaseAuthController extends GetxController {
  final RxBool isLoading = false.obs;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _google = GoogleSignIn();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      AuthException.fromCode(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUpWithEmailAndPassword(String password, String email, Users user) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'first_name': user.userFirstName,
        'last_name': user.userLastName,
        'user_name': user.userName,
        'email': user.email,
        'password': user.password,
        'user_date': user.userDate,
        'gender': user.gender,
        'travel_companion': user.travelCompanion,
        'health_and_safety': user.healthAndSafety,
        'need_troller': user.needStroller,
      });
    } on FirebaseAuthException catch (e) {
      AuthException.fromCode(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _google.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
    } catch (e) {
      print(e.toString());
    }
  }
}
