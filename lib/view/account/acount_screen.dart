import 'package:flutter/material.dart';
import 'package:flutter_app/controller/controller.dart';
import 'package:flutter_app/view/account/auth/sign_in_screen.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/user_image.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      authController.user.value?.fullName ??
                          'Sign in your account',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          buildAccountCard(title: 'Profile Info', onClick: () {}),
          buildAccountCard(title: 'Notification', onClick: () {}),
          buildAccountCard(title: 'Settings', onClick: () {}),
          buildAccountCard(title: 'About us', onClick: () {}),
          buildAccountCard(title: 'Terms of service', onClick: () {}),
          Obx(
            () => buildAccountCard(
                title:
                    authController.user.value == null ? 'Sign in' : 'Sign out',
                onClick: () {
                  if (authController.user.value != null) {
                    authController.signOut();
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                }),
          )
        ],
      ),
    );
  }

  Widget buildAccountCard(
      {required String title, required Function() onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 7)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
          )),
    );
  }
}
