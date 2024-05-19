 import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:untitled2/controllers/firebase_auth_controller.dart';
// import 'package:untitled2/controllers/theme_controller.dart';
import 'package:untitled2/form/controls/data.dart';
import 'package:untitled2/form/controls/date.dart';
import 'package:untitled2/form/controls/password.dart';
import 'package:untitled2/form/controls/select.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/models/users.dart';
import 'package:untitled2/pages/signin_page/signin_page.dart';
import 'package:untitled2/utils/alert.dart';
// import 'package:untitled2/controllers/firebase_auth_controller.dart';
import 'package:untitled2/widgets/button.dart';
// import 'package:untitled2/widgets/loading.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.appLocalizations,
  });

  final GlobalKey<FormBuilderState> formKey;
  final AppLocalizations? appLocalizations;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FirebaseAuthController authController = Get.find();
  // final ThemeController themeController = Get.find();

  int currentStep = 0;
  double height = 470;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: widget.formKey,
          child: SizedBox(
            height: height,
            width: Get.width,
            child: Stepper(
              elevation: 0,
              currentStep: currentStep,
              type: StepperType.horizontal,
              controlsBuilder: (context, details) {
                return const Text("");
              },
              steps: [
                _step1(context),
                _step2(context),
                _step3(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Step _step3(BuildContext context) {
    return Step(
      state: currentStep == 2
          ? StepState.editing
          : currentStep > 2
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 2,
      title: Text(widget.appLocalizations!.step(3)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Select(
            options: const ["Father", "Mother", "Brother", "Sister", "Friends"],
            name: "travel_companion",
            label: widget.appLocalizations!.travelCompanion,
            prefixIcon: const Icon(Icons.travel_explore),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Select(
            options: [
              widget.appLocalizations!.heart,
              widget.appLocalizations!.asthma,
              widget.appLocalizations!.noCondition
            ],
            name: "health_and_safety",
            label: "Health Safety",
            prefixIcon: const Icon(Icons.health_and_safety),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FormBuilderCheckbox(
              validator: FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
              contentPadding: EdgeInsets.zero,
              name: 'need_stroller',
              title: Text(
                widget.appLocalizations!.needStroller,
                style: TextStyle(fontSize: Get.width * 0.04),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
            width: Get.width,
            text: widget.appLocalizations!.createNewAccount,
            onPressed: () {
              _handleSignUp();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Button(
              width: 100,
              text: widget.appLocalizations!.back,
              onPressed: () => _stepChanges(false),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context),
        ],
      ),
    );
  }

  Step _step2(BuildContext context) {
    return Step(
      state: currentStep == 1
          ? StepState.editing
          : currentStep > 1
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 1,
      title: Text(widget.appLocalizations!.step(2)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Password(
            name: "password",
            label: widget.appLocalizations!.password,
            prefixIcon: const Icon(Icons.lock),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
              FormBuilderValidators.minLength(
                8,
                errorText: widget.appLocalizations!.passwordErrorText,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Password(
            name: "re_password",
            label: widget.appLocalizations!.confirmPassword,
            prefixIcon: const Icon(Icons.lock),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Date(
                name: "date",
                label: widget.appLocalizations!.dateOfBirth,
                prefixIcon: const Icon(Icons.calendar_today),
                width: Get.width / 2.35,
                validators: [
                  FormBuilderValidators.required(
                    errorText: widget.appLocalizations!.notRequired,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Select(
                name: "gender",
                label: widget.appLocalizations!.gender,
                options: [
                  widget.appLocalizations!.male,
                  widget.appLocalizations!.female
                ],
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
                validators: [
                  FormBuilderValidators.required(
                    errorText: widget.appLocalizations!.notRequired,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                width: 100,
                text: widget.appLocalizations!.back,
                onPressed: () => _stepChanges(false),
              ),
              Button(
                width: 100,
                text: widget.appLocalizations!.next,
                onPressed: () => _stepChanges(true),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context)
        ],
      ),
    );
  }

  void _stepChanges(bool isInc) {
    setState(() {
      isInc ? currentStep++ : currentStep--;
    });
  }

  Step _step1(BuildContext context) {
    return Step(
      state: currentStep == 0
          ? StepState.editing
          : currentStep > 0
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 0,
      title: Text(widget.appLocalizations!.step(3)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Data(
                name: "first_name",
                label: widget.appLocalizations!.firstName,
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
                validators: [
                  FormBuilderValidators.required(
                    errorText: widget.appLocalizations!.notRequired,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Data(
                name: "last_name",
                label: widget.appLocalizations!.lastName,
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
                validators: [
                  FormBuilderValidators.required(
                    errorText: widget.appLocalizations!.notRequired,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Data(
            name: "user_name",
            label: widget.appLocalizations!.username,
            prefixIcon: const Icon(Icons.person),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
              FormBuilderValidators.minLength(
                6,
                errorText: widget.appLocalizations!.userNameErrorText,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Data(
            name: "email",
            label: widget.appLocalizations!.email,
            prefixIcon: const Icon(Icons.person),
            validators: [
              FormBuilderValidators.required(
                errorText: widget.appLocalizations!.notRequired,
              ),
              FormBuilderValidators.email(
                errorText: widget.appLocalizations!.emailErrorText,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Button(
              width: 100,
              text: widget.appLocalizations!.next,
              onPressed: () => _stepChanges(true),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context)
        ],
      ),
    );
  }

  void _handleSignUp() async {
    if (widget.formKey.currentState!.saveAndValidate()) {
      if (widget.formKey.currentState!.fields['re_password']!.value ==
          widget.formKey.currentState!.fields['password']!.value) {
        await authController
            .signUpWithEmailAndPassword(
          widget.formKey.currentState!.value['password'],
          widget.formKey.currentState!.value['email'],
          Users(
            userFirstName: widget.formKey.currentState!.value['first_name'],
            userLastName: widget.formKey.currentState!.value['last_name'],
            userName: widget.formKey.currentState!.value['user_name'],
            email: widget.formKey.currentState!.value['email'],
            password: widget.formKey.currentState!.value['password'],
            userDate: widget.formKey.currentState!.value['date'],
            gender: widget.formKey.currentState!.value['gender'],
            travelCompanion:
                widget.formKey.currentState!.value['travel_companion'],
            healthAndSafety:
                widget.formKey.currentState!.value['health_and_safety'],
            needStroller: widget.formKey.currentState!.value['need_stroller'],
          ),
        )
            .then((value) {
          Alert.snackbar("Success", widget.appLocalizations!.createdAccont);
          Get.offAllNamed(HomePage.id);
        });
      } else {
        Alert.snackbar("Error", widget.appLocalizations!.passwordsDoNotMatch);
      }
    }
  }

  Row _buildSignInBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.appLocalizations!.alreadyHaveAccount),
        SizedBox(width: Get.width * 0.01),
        GestureDetector(
          onTap: () => Get.toNamed(SignInPage.id),
          child: Text(
            widget.appLocalizations!.login,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
