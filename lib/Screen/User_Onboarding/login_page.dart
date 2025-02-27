import 'package:expense_app/Bloc/UserBloc/user_bloc.dart';
import 'package:expense_app/Bloc/UserBloc/user_event.dart';
import 'package:expense_app/Bloc/UserBloc/user_state.dart';
import 'package:expense_app/Screen/Home/home_page.dart';
import 'package:expense_app/Screen/User_Onboarding/sign_up_page.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/image_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaqueryData = MediaQuery.of(context);
    var mWidth = mediaqueryData.size.width;
    var mHeight = mediaqueryData.size.height;
    print("MQwidth:$mWidth, MQHeight: $mHeight");
    var mOrientation = mediaqueryData.orientation;
    print(mOrientation);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: mOrientation == Orientation.portrait
                ? portraitUI(mWidth, mHeight)
                : landScapeUI(mWidth, mHeight)));
  }

  Widget mainUI(double mWidth, double mHeight) {
    return mHeight > 334
        ? mainSubUI(mWidth, mHeight)
        : SingleChildScrollView(child: mainSubUI(mWidth, mHeight));
  }

  Widget mainSubUI(double mWidth, double mHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: mWidth * 0.08,
          child: Image.asset(
            ImageConstants.appLogoIcon,
            color: Colors.grey.shade100,
            width: mWidth * 0.075,
            height: mWidth * 0.075,
          ),
        ),
        hSpacer(mHeight: 16),
        SizedBox(
          width: mWidth * 0.4,
          child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                'Welcome, Back!!',
                style: mTextStyle34(mWeight: FontWeight.bold),
              )),
        ),
        hSpacer(),
        TextField(
            controller: emailController,
            decoration: myDecoration(
                mPrefixIcon: Icons.email_outlined,
                mLabel: "Email",
                mHint: "Enter your Email..")),
        hSpacer(),
        TextField(
            controller: passController,
            obscuringCharacter: "*",
            obscureText: true,
            decoration: myDecoration(
                mPrefixIcon: Icons.password,
                mLabel: "Password",
                mHint: "Enter your Email..")),
        hSpacer(mHeight: 16),
        BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("User LoggedIn Successfully!!!...")));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            } else if (state is UserFailState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.failMsg)));
            }
          },
          builder: (_, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return AppRoundedButton(
                onTap: () {
                  var email = emailController.text.toString();
                  var pass = passController.text.toString();
                  context
                      .read<UserBloc>()
                      .add(LoginUserEvent(email: email, pass: pass));
                },
                title: "Login");
          },
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ));
            },
            child: Text(
              "Diden\t have an account!!  ,Create Now",
              style: mTextStyle25(),
            )),
      ],
    );
  }

  Widget portraitUI(double mWidth, double mHeight) {
    return mainUI(mWidth, mHeight);
  }

  Widget landScapeUI(double mWidth, double mHeight) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: mWidth * 0.01,
            child: Image.asset(
              ImageConstants.appLogoIcon,
              color: Colors.grey.shade100,
              width: mHeight * 0.09,
              height: mHeight * 0.09,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: LayoutBuilder(builder: (context, constraints) {
              var mWidth = constraints.maxWidth;
              var mHeight = constraints.maxHeight;
              print("LBwidth:$mWidth, LBHeight: $mHeight");
              return mainUI(constraints.maxWidth, mHeight);
            })),
      ],
    );
  }
}

/* Widget mainUI(double mWidth, bool isLandScape){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: mWidth*0.08,
          child: Image.asset(ImageConstants.appLogoIcon,width: mWidth*0.075,height:mWidth*0.075 ,color:Colors.grey.shade100 ,),
        ),
        hSpacer(mHeight: 16),
        Text("WelCome ,Back!!",
          style: mTextStyle25(mWeight: FontWeight.bold),
        ),
        hSpacer(),
        SizedBox(
          height: 200,
           width: double.infinity,

          child: isLandScape ? Row(children: [
            Expanded(
              child: TextField(
                decoration: myDecoration(mLabel: "Email", mHint: "Enter Your Email_id",mPrefixIcon: Icons.email),
              ),
            ),
            wSpacer(),
            Expanded(
              child: TextField(
                decoration: myDecoration(mLabel: "Password", mHint: "Enter Password",mPrefixIcon: Icons.password),
              ),
            ),
          ],)
              : Column(children: [
                          TextField(
              decoration: myDecoration(mLabel: "Email", mHint: "Enter Your Email_id",mPrefixIcon: Icons.email),
                          ),
                          hSpacer(),
                          TextField(
              decoration: myDecoration(mLabel: "Password", mHint: "Enter Password",mPrefixIcon: Icons.password),
                          ),
                        ],),
        ),
        hSpacer(),
        AppRoundedButton(onTap: (){}, title: "Login")


      ],
    );

  }*/

/*
Widget portraitUI(double mWidth){
  return mainUI(mWidth,false);
}

Widget landScapeUI(double  mWidth){
  return Expanded(child:mainUI(mWidth,true) );
}*/
