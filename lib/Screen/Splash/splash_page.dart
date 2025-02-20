import 'package:expense_app/Screen/Utils/image_constants.dart';
import 'package:expense_app/Screen/Utils/my_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaqueryData =MediaQuery.of(context);
    var mWidth=mediaqueryData.size.width;
    var mHeight=mediaqueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
     body: Center(
       child: Column(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [
         CircleAvatar(
           backgroundColor: Colors.black,
           radius: mediaqueryData.size.width*0.05,
           child: Image.asset(ImageConstants.appLogoIcon,width: mWidth*0.048,height:mWidth*0.048 ,color:Colors.grey.shade100 ,),
         ),
         Text("Expenser",style: mWidth>600 ? mTextStyle43(mWeight: FontWeight.bold): mTextStyle34(mWeight: FontWeight.bold))
       ],),
     ),
    );
  }
}
