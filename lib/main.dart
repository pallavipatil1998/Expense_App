import 'package:expense_app/Bloc/ExpenseBloc/expense_bloc.dart';
import 'package:expense_app/Bloc/UserBloc/user_bloc.dart';
import 'package:expense_app/DataBase/app_database.dart';
import 'package:expense_app/Provider/user_pref_provider.dart';
import 'package:expense_app/Screen/ADD_Transaction/add_transaction_page.dart';
import 'package:expense_app/Screen/Home/home_page.dart';
import 'package:expense_app/Screen/Splash/splash_page.dart';
import 'package:expense_app/Screen/User_Onboarding/login_page.dart';
import 'package:expense_app/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(create: (context) => ExpenseBloc(db: AppDataBase.db),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage()
    );
  }
}


