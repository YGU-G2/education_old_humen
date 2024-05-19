import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:untitled2/controllers/theme_controller.dart';
import 'package:untitled2/form/controls/data.dart';
import 'package:untitled2/form/controls/password.dart';
import 'package:untitled2/widgets/button.dart';
import 'package:untitled2/widgets/loading.dart';
import 'package:untitled2/controllers/firebase_auth_controller.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.formKey,
    required this.appLocalizations,
  });

  final GlobalKey<FormBuilderState> formKey;
  final AppLocalizations? appLocalizations;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final FirebaseAuthController authController =
      Get.put(FirebaseAuthController());
  // final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        children: [
          _buildEmailField(),
          _buildPassword(),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.toNamed("forgot-password"),
              child: Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          _buildSinIn(),
          SizedBox(height: Get.height * 0.02),
          _buildGoogleBtn(),
          SizedBox(height: Get.height * 0.02),
          _buildSignUpBtn(context)
        ],
      ),
    );
  }

  void _handleSignIn() async {
    if (widget.formKey.currentState!.saveAndValidate()) {
      await authController.signInWithEmailAndPassword(
        widget.formKey.currentState!.value['email'],
        widget.formKey.currentState!.value['password'],
      );
    }
  }

  Padding _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Data(
        name: 'email',
        label: widget.appLocalizations!.email,
        prefixIcon: const Icon(Icons.person),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ],
      ),
    );
  }

  Padding _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Password(
        name: 'password',
        label: widget.appLocalizations!.password,
        prefixIcon: const Icon(Icons.lock),
        validators: [
          FormBuilderValidators.required(),
        ],
      ),
    );
  }

  Container _buildSinIn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: Get.height * 0.06,
      width: Get.width,
      child: _buildSignInButton(),
    );
  }

  Obx _buildSignInButton() {
    return Obx(
      () => authController.isLoading.value
          ? Loading.circle
          : Button(
              text: widget.appLocalizations!.login,
              onPressed: _handleSignIn,
            ),
    );
  }

  Container _buildGoogleBtn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: Get.height * 0.05,
      child: MaterialButton(
        color: Colors.black12,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        onPressed: () async {
          await authController.signInWithGoogle().then(
                (value) => Get.offAllNamed('home'),
              );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.05,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/googleimage.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(widget.appLocalizations!.continueWithGoogle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSignUpBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.appLocalizations!.dontHaveAnAccount),
        SizedBox(width: Get.width * 0.01),
        GestureDetector(
          onTap: () => Get.toNamed('signup'),
          child: Text(
            widget.appLocalizations!.createAccount,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
