import 'package:expense_app/Bloc/ExpenseBloc/expense_bloc.dart';
import 'package:expense_app/Bloc/ExpenseBloc/expense_state.dart';
import 'package:expense_app/Screen/ADD_Transaction/add_transaction_page.dart';
import 'package:expense_app/Screen/User_Onboarding/login_page.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: BlocBuilder<ExpenseBloc,ExpenseState>(
        builder: (_,state){
          if(state is ExpenseLoaded){
            return ListView.builder(
              itemCount: state.listExpense.length,
              itemBuilder: (_,index){
                var currData=state.listExpense[index];
                return ListTile(
                  title: Text(currData.exp_title),
                  subtitle: Text(currData.exp_desc),
                  leading: Text(currData.exp_time)
                );


              },
            );

          }else if(state is ExpenseLoading){
            return Center(child: CircularProgressIndicator());
          }
          return Center(child: Container(child: Text("Data Not Added",style: mTextStyle25(mWeight: FontWeight.bold),),));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => AddTransactionPage(),));
      },
        child: Icon(Icons.add),
      ),

    );
  }
}
