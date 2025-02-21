import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    print("MQweight:$mWidth, MQHeight: $mHeight");
    var mOrientation =mediaqueryData.orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: mOrientation == Orientation.portrait ? portraitUI(mWidth,mHeight) : landScapeUI(mWidth,mHeight)
      )

    );

  }

Widget mainUI(double mWidth,double mHeight){
    return mHeight>334 ? mainSubUI(mWidth, mHeight) : SingleChildScrollView(child: mainSubUI(mWidth, mHeight)) ;
}

Widget mainSubUI(double mWidth,double mHeight){
    return  Column(
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
              child: SizedBox(
                width: mWidth * 0.4,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome, Back!!',
                    style: mTextStyle34(mWeight: FontWeight.bold),
                  ),
                ),
              )),
        ),
        hSpacer(),
        TextField(
            decoration: myDecoration(
                mPrefixIcon: Icons.email_outlined,
                mLabel: "Email",
                mHint: "Enter your Email..")),
        hSpacer(),
        TextField(
            obscuringCharacter: "*",
            obscureText: true,
            decoration: myDecoration(
                mPrefixIcon: Icons.password,
                mLabel: "Password",
                mHint: "Enter your Email..")),
        hSpacer(mHeight: 16),
        AppRoundedButton(onTap: () {}, title: "Login")
      ],
    );
}


  Widget portraitUI(double mWidth,double mHeight){
    return mainUI(mWidth,mHeight);
  }

  Widget landScapeUI(double  mWidth,double mHeight){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child:CircleAvatar(
          backgroundColor: Colors.black,
          radius: mWidth * 0.08,
          child: Image.asset(
            ImageConstants.appLogoIcon,
            color: Colors.grey.shade100,
            width: mWidth * 0.075,
            height: mWidth * 0.075,
          ),
        ), ),
        Expanded(
          flex: 2,
            child:LayoutBuilder(
          builder: (context,constraints) {
            var mWidth=constraints.maxWidth;
            var mHeight=constraints.maxHeight;
            print("LBweight:$mWidth, LBHeight: $mHeight");
            return mainUI(constraints.maxWidth,mHeight);
          }
        ) ),
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
