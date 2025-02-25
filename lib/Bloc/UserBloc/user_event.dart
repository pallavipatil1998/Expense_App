import '../../Models/user_model.dart';

abstract class UserEvent{}

class CreateNewUserEvent extends UserEvent{
  UserModel newUser ;
  CreateNewUserEvent({required this.newUser});
}

class LoginUserEvent extends UserEvent{
  String email,pass;
  LoginUserEvent({required this.email,required this.pass});
}