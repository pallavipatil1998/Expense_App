import 'package:expense_app/Bloc/UserBloc/user_bloc.dart';
import 'package:expense_app/Bloc/UserBloc/user_event.dart';
import 'package:expense_app/Bloc/UserBloc/user_state.dart';
import 'package:expense_app/Models/user_model.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("User Account Created...")));
                Navigator.pop(context);
              } else if (state is UserFailState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.failMsg)));
              }
            },
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return AppRoundedButton(
                  onTap: () {
                    var email = emailController.text.toString();
                    var pass = passController.text.toString();
                    var mob_no = mob_noController.text.toString();
                    var gender = genderController.text.toString();
                    context.read<UserBloc>().add(CreateNewUserEvent(
                        newUser: UserModel(
                            email: email,
                            pass: pass,
                            mob_no: mob_no,
                            gender: gender)));
                  },
                  title: "Create Account ");
            },
          )
        ],
      ),
    );
  }
}
