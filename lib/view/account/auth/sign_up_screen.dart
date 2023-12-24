import 'package:flutter/material.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:flutter_app/extention/string_extenstion.dart';
import 'package:flutter_app/view/account/auth/sign_in_screen.dart';
import 'package:flutter_app/widgets/input_ouline_button.dart';
import 'package:flutter_app/widgets/input_text_button.dart';
import 'package:flutter_app/widgets/input_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sign up to continue!',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    letterSpacing: 1.2),
              ),
              const Spacer(
                flex: 3,
              ),
              InputTextField(
                title: 'Full Name',
                textEditingController: fullNameController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                title: 'Email',
                textEditingController: emailController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else if (!value.isValidEmail) {
                    return "Please enter valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                title: 'Password',
                obsecureText: true,
                textEditingController: passwordController,
                validation: (String? value) {
                  List<String> validation = [];
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else {
                    if (!value.isValidPasswordHasNumber) {
                      validation.add("Must contain 1 number");
                    }
                    if (!value.isValidPasswordHasCapitalLetter) {
                      validation.add("Must contain 1 capital letter");
                    }
                    if (!value.isValidPasswordHasLowerCaseLetter) {
                      validation.add("Must contain 1 simple letter");
                    }
                    if (!value.isValidPasswordHasSpecialCharacter) {
                      validation.add("Must contain 1 special letter");
                    }
                  }
                  String? msg;
                  if (validation.isNotEmpty) {
                    for (var i = 0; i < validation.length; i++) {
                      msg = msg ?? validation[i];
                      if ((i + 1) != validation.length) {
                        msg = '$msg\n';
                      }
                    }
                  }
                  return msg;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                title: 'Confirm Password',
                obsecureText: true,
                textEditingController: confirmPasswordController,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  } else if (passwordController.text != value) {
                    return "Confirm password not match";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              InputTextButton(
                  title: 'Sign Un',
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signUp(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              InputOutlineButton(
                  title: 'Back',
                  onClick: () {
                    Navigator.of(context).pop();
                  }),
              const Spacer(
                flex: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I'am already a member, "),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      )),
    );
  }
}
