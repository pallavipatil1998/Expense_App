import 'dart:async';

import 'package:expense_app/Screen/Home/home_page.dart';
import 'package:expense_app/Screen/User_Onboarding/login_page.dart';
import 'package:expense_app/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import '../../Utils/image_constants.dart';
import '../../Utils/my_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), ()async{
      int uid=await UserPreference().getUserId();
      Widget nextPage;
      if(uid>0){
        nextPage=HomePage();
      }else{
        nextPage=LoginPage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage,));
    });
  }


  @override
  Widget build(BuildContext context) {
    var mediaqueryData =MediaQuery.of(context);
    var mWidth=mediaqueryData.size.width;
    var mHeight=mediaqueryData.size.height;
    print("MQweight:$mWidth, MQHeight: $mHeight");
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
     body: Center(
       child: Column(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [
         CircleAvatar(
           backgroundColor: Colors.black,
           radius: mWidth*0.05,
           child: Image.asset(ImageConstants.appLogoIcon,width: mWidth*0.048,height:mWidth*0.048 ,color:Colors.grey.shade100 ,),
         ),
         Text("Expenser",style: mWidth>600 ? mTextStyle43(mWeight: FontWeight.bold): mTextStyle34(mWeight: FontWeight.bold))
       ],),
     ),
    );
  }
}
