import 'package:expense_app/Bloc/ExpenseBloc/expense_bloc.dart';
import 'package:expense_app/Bloc/ExpenseBloc/expense_state.dart';
import 'package:expense_app/Constants/app_constans.dart';
import 'package:expense_app/Models/expense_model.dart';
import 'package:expense_app/Screen/ADD_Transaction/add_transaction_page.dart';
import 'package:expense_app/Screen/User_Onboarding/login_page.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/ExpenseBloc/expense_event.dart';
import '../../Models/filtered_expense_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilteredExpenseModel> dateWiseExpenseList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (_, state) {
            if (state is ExpenseLoaded) {
              filteredExpenseByDate(state.listExpense);
              return ListView.builder(
                itemCount: dateWiseExpenseList.length,
                itemBuilder: (_, index) {
                  var currData = dateWiseExpenseList[index];

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currData.dateName),
                          Text("${currData.totalAmt}"),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: currData.expenseList.length,
                        itemBuilder: (ctx, childIndex) {
                          var currExp = currData.expenseList[childIndex];
                          var imgPath = AppConstants.categories.firstWhere(
                              (element) =>
                                  element['id'] == currExp.exp_cat_id)['img'];

                          return ListTile(
                            leading: Image.asset(imgPath),
                            title: Text(currExp.exp_title),
                            subtitle: Text(currExp.exp_desc),
                            trailing: Text("${currExp.exp_amt}"),
                          );
                        },
                      )
                    ],
                  );
                },
              );
            } else if (state is ExpenseLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
                child: Container(
              child: Text(
                "Data Not Added",
                style: mTextStyle25(mWeight: FontWeight.bold),
              ),
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactionPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  filteredExpenseByDate(List<ExpenseModel> filtExList) {
    dateWiseExpenseList.clear();
    List<String> uniqueDateList = [];

    //1 find unique date
    for (ExpenseModel eachExpense in filtExList) {
      var eachDate = DateTime.parse(eachExpense.exp_time);
      var mDate = "${eachDate.year}"
          "-${eachDate.month.toString().length < 2 ? "0${eachDate.month}" : eachDate.month}"
          "${eachDate.day.toString().length < 2 ? "-0${eachDate.day}" : eachDate.day}";

      if (!uniqueDateList.contains(mDate)) {
        uniqueDateList.add(mDate);
      }
      print(uniqueDateList);
    }

    //2

    for (String eachUniqueDate in uniqueDateList) {
      List<ExpenseModel> eachDateExpense = [];
      num eachDateAmt = 0;

      for (ExpenseModel eachExp in filtExList) {
        if (eachExp.exp_time.contains(eachUniqueDate)) {
          eachDateExpense.add(eachExp);
          if (eachExp.exp_type == 0) {
            eachDateAmt -= eachExp.exp_amt;
          } else {
            eachDateAmt += eachExp.exp_amt;
          }
        }
      }
      print(eachDateAmt);

/* if(eachDateAmt>maxAmt){
        maxAmt=eachDateAmt;
      }*/

      dateWiseExpenseList.add(FilteredExpenseModel(
          dateName: eachUniqueDate,
          totalAmt: eachDateAmt,
          expenseList: eachDateExpense));
    }
    print(dateWiseExpenseList.length);
  }
}
