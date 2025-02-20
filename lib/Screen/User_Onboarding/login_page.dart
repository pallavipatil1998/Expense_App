import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:flutter/material.dart';

import '../../Utils/image_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var mediaqueryData =MediaQuery.of(context);
    var mWidth=mediaqueryData.size.width;
    var mHeight=mediaqueryData.size.height;
    var mOrientation =mediaqueryData.orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: mOrientation == Orientation.portrait ? portraitUI(mWidth) : landScapeUI(mWidth)
      )

    );

  }

  Widget mainUI(double mWidth, bool isLandScape){
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

  }

  Widget portraitUI(double mWidth){
    return mainUI(mWidth,false);
  }

  Widget landScapeUI(double  mWidth){
    return Expanded(child:mainUI(mWidth,true) );
  }



}


