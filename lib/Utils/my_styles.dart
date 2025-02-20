 import 'dart:ui';

import 'package:expense_app/Utils/color_constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

//1] for TextFont
TextStyle mTextStyle12({
   FontWeight mWeight=FontWeight.normal,
   Color fontColor= Colors.black
 }){
  return TextStyle(
    fontSize: 12,
    fontFamily: "BadScript",
    fontWeight: mWeight,
    color: fontColor
  );
 }



 TextStyle mTextStyle16({
   FontWeight mWeight=FontWeight.normal,
   Color fontColor= Colors.black
 }){
   return TextStyle(
       fontSize: 16,
       fontFamily: "BadScript",
       fontWeight: mWeight,
       color: fontColor
   );
 }


 TextStyle mTextStyle25({
   FontWeight mWeight=FontWeight.normal,
   Color fontColor= Colors.black
 }){
   return TextStyle(
       fontSize: 25,
       fontFamily: "BadScript",
       fontWeight: mWeight,
       color: fontColor
   );
 }


 TextStyle mTextStyle34({
   FontWeight mWeight=FontWeight.normal,
   Color fontColor= Colors.black
 }){
   return TextStyle(
       fontSize: 34,
       fontFamily: "BadScript",
       fontWeight: mWeight,
       color: fontColor
   );
 }


 TextStyle mTextStyle43({
   FontWeight mWeight=FontWeight.normal,
   Color fontColor= Colors.black
 }){
   return TextStyle(
       fontSize: 43,
       fontFamily: "BadScript",
       fontWeight: mWeight,
       color: fontColor
   );
 }

 //2] Width Spacing [SizedBox]
 Widget wSpacer({double mWidth=11}){
  return SizedBox(width: mWidth,);
 }

 Widget hSpacer({double mHeight=11}){
  return SizedBox(
    height: mHeight,
  );
 }

 //3] TextField Decoration
 InputDecoration myDecoration({IconData? mPrefixIcon,required String mLabel,required String mHint}){
  return InputDecoration(
  label: Text(mLabel) ,
  hintText:mHint ,
  prefixIcon: mPrefixIcon!=null ? Icon(mPrefixIcon): null,
 border: OutlineInputBorder(
   borderRadius: BorderRadius.circular(21),
   borderSide: BorderSide(
     color:ColorConstants.mattBlackColor,
     width: 1
   )
 ),

  );
 }