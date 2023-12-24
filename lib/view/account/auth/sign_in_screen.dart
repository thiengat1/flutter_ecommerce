import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:flutter_app/view/account/auth/sign_up_screen.dart';
import 'package:flutter_app/widgets/input_ouline_button.dart';
import 'package:flutter_app/widgets/input_text_button.dart';
import 'package:flutter_app/widgets/input_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sign in to continue!',
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
                title: 'Email',
                textEditingController: emailController,
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
                title: 'Password',
                obsecureText: true,
                textEditingController: passwordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              const Spacer(),
              InputTextButton(
                  title: 'Sign In',
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signIn(
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
                  const Text("I'am new user, "),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Sign up',
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
