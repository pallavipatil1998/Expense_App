import '../../Models/expense_model.dart';

abstract class ExpenseState{}

class ExpenseInitial extends ExpenseState{}
class ExpenseLoading extends ExpenseState{}
class ExpenseLoaded extends ExpenseState{
  List<ExpenseModel> listExpense=[];
  ExpenseLoaded({required this.listExpense});
}
class ExpenseError extends ExpenseState{
  String errorMasg;
  ExpenseError({required this.errorMasg});
}
