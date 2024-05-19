import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        EdgeInsets,
        FontWeight,
        GlobalKey,
        MainAxisAlignment,
        Padding,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'signin_form.dart';

class SignInPage extends StatefulWidget {
  static String id = '/signin';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: Get.width * 0.08),
                  child: Text(
                    appLocalizations!.helloTxt,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  appLocalizations.signinToYourAccount,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                SignInForm(
                  formKey: formKey,
                  appLocalizations: appLocalizations,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
