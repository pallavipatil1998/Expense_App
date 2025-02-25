import 'package:expense_app/DataBase/app_database.dart';

class UserModel {
  int? u_id;
  String email;
  String pass;
  String mob_no;
  String gender;



  UserModel({
    this.u_id,
    required this.email,
    required this.pass,
    required this.mob_no,
    required this.gender,

  });


  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      u_id: map[AppDataBase.USER_COLUMN_ID],
      email: map[AppDataBase.USER_COLUMN_EMAIL],
      pass: map[AppDataBase.USER_COLUMN_PASS],
      mob_no: map[AppDataBase.USER_COLUMN_MOB_NO],
      gender: map[AppDataBase.USER_COLUMN_GENDER],
    );
  }



  Map<String ,dynamic> toMap(){
    return {
      AppDataBase.USER_COLUMN_ID :u_id,
      AppDataBase.USER_COLUMN_EMAIL :email,
      AppDataBase.USER_COLUMN_PASS :pass,
      AppDataBase.USER_COLUMN_MOB_NO :mob_no,
      AppDataBase.USER_COLUMN_GENDER :gender,

    };
  }


}