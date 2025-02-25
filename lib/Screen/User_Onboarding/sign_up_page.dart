import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var mob_noController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Sign up",
            style: mTextStyle43(mWeight: FontWeight.bold),
          ),
          hSpacer(),
          TextField(
            controller: emailController,
            decoration:
                myDecoration(mLabel: "Email", mHint: "Enter Your Email..!!"),
          ),
          hSpacer(),
          TextField(
            controller: passController,
            decoration: myDecoration(
                mLabel: "Password", mHint: "Enter Your Password..!!"),
          ),
          hSpacer(),
          TextField(
            controller: mob_noController,
            decoration:
                myDecoration(mLabel: "Mob_No", mHint: "Enter Your Mob_No..!!"),
          ),
          hSpacer(),
          TextField(
            controller: genderController,
            decoration:
                myDecoration(mLabel: "Gender", mHint: "Enter Your Gnder..!!"),
          ),
          hSpacer(),
          AppRoundedButton(onTap: () {}, title: "SignUP")
        ],
      ),
    );
  }
}
