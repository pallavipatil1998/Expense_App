import 'package:expense_app/Bloc/UserBloc/user_event.dart';
import 'package:expense_app/Bloc/UserBloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../DataBase/app_database.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  AppDataBase db;
  UserBloc({required this.db}):super(UserInitialState()){
  on<CreateNewUserEvent>((event, emit)async {
    emit(UserLoadingState());
    bool check=await db.createAccount(event.newUser);
    if(check){
      emit(UserSuccessState());
    }else{
      emit(UserFailState(failMsg: "Email Already Exist..."));
    }
  });

  on<LoginUserEvent>((event, emit)async {
    emit(UserLoadingState());
    bool check=await db.authenticateUser(event.email,event.pass);
    if(check){
      emit(UserSuccessState());
    }else{
      emit(UserFailState(failMsg: "Inavlid UserName And Password"));
    }
  },);
  }
}