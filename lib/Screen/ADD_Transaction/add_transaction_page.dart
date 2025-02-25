import 'package:expense_app/Bloc/ExpenseBloc/expense_bloc.dart';
import 'package:expense_app/Bloc/ExpenseBloc/expense_event.dart';
import 'package:expense_app/Constants/app_constans.dart';
import 'package:expense_app/Models/expense_model.dart';
import 'package:expense_app/Utils/my_styles.dart';
import 'package:expense_app/app_Widget/app_rounded_button.dart';
import 'package:expense_app/user_preference/user_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  var titileController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  var selectedCatIndex = -1;
  var listCatType = ["Debit", "Credit"];
  var selectedTransactionType = "Debit";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              hSpacer(mHeight: 30),
              TextField(
                controller: titileController,
                decoration: myDecoration(mLabel: "Title", mHint: "Enter Title"),
              ),
              hSpacer(),
              TextField(
                controller: descController,
                decoration: myDecoration(mLabel: "Desc", mHint: "Enter Desc"),
              ),
              hSpacer(),
              TextField(
                controller: amtController,
                decoration:
                myDecoration(mLabel: "Amount", mHint: "Enter Amount"),
              ),
              hSpacer(),
              AppRoundedButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                              itemCount: AppConstants.categories.length,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedCatIndex = index;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          AppConstants.categories[index]
                                          ["img"],
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Text(AppConstants.categories[index]
                                      ["name"]),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      );
                    },
                  );
                },
                title: "Chose Category",
                mWidget: selectedCatIndex >= 0 ?
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppConstants.categories[selectedCatIndex]["img"],
                      height: 30, width: 30,),
                    Text("-", style: mTextStyle25(fontColor: Colors.white),),
                    Text(AppConstants.categories[selectedCatIndex]["name"],
                      style: mTextStyle25(fontColor: Colors.white),),
                  ],
                ) : null,
              ),
              hSpacer(),
              DropdownButton(
                value: selectedTransactionType,
                items: listCatType.map((e) =>
                    DropdownMenuItem(child: Text(e), value: e,),).toList(),
                onChanged: (val) {
                  selectedTransactionType = val!;
                },
              ),
              hSpacer(),
              AppRoundedButton(onTap: () async{
                context.read<ExpenseBloc>().add(AddExpenseEvent(
                    newExpense: ExpenseModel(
                        u_id: 0,
                        exp_title: titileController.text.toString(),
                        exp_desc: descController.text.toString(),
                        exp_amt: double.parse(amtController.text.toString()),
                        exp_bal: 0,
                        exp_type: selectedTransactionType=="Debit" ? 0:1,
                        exp_cat_id: AppConstants.categories[selectedCatIndex]["id"],
                        exp_time: DateTime.now().toString()
                    )));
                Navigator.pop(context);
              },
                  title: "Add Trnsaction")
            ],
          ),
        ),
      ),
    );
  }
}
