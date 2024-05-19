import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:untitled2/utils/alert.dart';

class AuthException {
  static fromCode(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        Alert.snackbar(
          "Error",
          "No user found for that email.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'wrong-password':
        Alert.snackbar(
          "Error",
          "Wrong password provided for that user.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'INVALID_LOGIN_CREDENTIALS':
        Alert.snackbar(
          "Error",
          "Invalid login credentials.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'too-many-requests':
        Alert.snackbar(
          "Error",
          "Too many requests. Try again later.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'weak-password':
        Alert.snackbar(
          "Error",
          "The password provided is too weak.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'email-already-in-use':
        Alert.snackbar(
          "Error",
          "The account already exists for that email.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'invalid-email':
        Alert.snackbar(
          "Error",
          "The email address is not valid.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'operation-not-allowed':
        Alert.snackbar(
          "Error",
          "The requested operation is not allowed.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'network-request-failed':
        Alert.snackbar(
          "Error",
          "A network error occurred. Please check your internet connection.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'user-disabled':
        Alert.snackbar(
          "Error",
          "The user account has been disabled by an administrator.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'invalid-credential':
        Alert.snackbar(
          "Error",
          "The supplied credential is malformed or has expired.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'account-exists-with-different-credential':
        Alert.snackbar(
          "Error",
          "An account already exists with the same email address but different sign-in credentials.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'invalid-verification-code':
        Alert.snackbar(
          "Error",
          "The verification code is invalid.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'invalid-verification-id':
        Alert.snackbar(
          "Error",
          "The verification ID is invalid.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      case 'requires-recent-login':
        Alert.snackbar(
          "Error",
          "Cannot update your password right now. Please try again later or re-login to your account.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
        break;
      default:
        Alert.snackbar(
          "Error",
          "An unexpected error occurred.",
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
        );
    }
  }
}
