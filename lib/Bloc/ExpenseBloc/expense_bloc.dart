import 'package:expense_app/user_preference/user_preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../DataBase/app_database.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent,ExpenseState>{
  AppDataBase db;
  ExpenseBloc({required this.db}):super(ExpenseInitial()){

    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      bool check=await db.addExpense(event.newExpense);
      if(check){
        var expense= await db.getAllExpensesOfUser();
        emit(ExpenseLoaded(listExpense: expense));
      }else{
        emit(ExpenseError(errorMasg: "Expense Not Added"));
      }
    }  );


    on<FetchAllExpense>((event, emit)async {
      emit(ExpenseLoading());
      var expense=await db.getAllExpensesOfUser();
      emit(ExpenseLoaded(listExpense: expense));
    }
    ,);

  }

}