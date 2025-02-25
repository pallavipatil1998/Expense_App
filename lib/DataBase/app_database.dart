import 'dart:io';
import 'package:expense_app/Models/expense_model.dart';
import 'package:expense_app/Models/user_model.dart';
import 'package:expense_app/user_preference/user_preference.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class AppDataBase{

  AppDataBase._();
  static final AppDataBase db=AppDataBase._();
  Database? _database;

  //expense
  static final EXPENSE_TABLE="expense_table";
  static final EXPENSE_COLUMN_ID="exp_id";
  static final EXPENSE_COLUMN_TITLE="exp_title";
  static final EXPENSE_COLUMN_DESC="exp_desc";
  static final EXPENSE_COLUMN_AMT="exp_amt";
  static final EXPENSE_COLUMN_BAL="exp_bal";
  static final EXPENSE_COLUMN_TYPE="exp_type";  //debit=0  & credit=1
  static final EXPENSE_COLUMN_CAT_ID="exp_cat_id";
  static final EXPENSE_COLUMN_TIME="exp_time";



  //User
  static final USER_TABLE="USER_table";
  static final USER_COLUMN_ID="u_id";
  static final USER_COLUMN_EMAIL="email";
  static final USER_COLUMN_PASS="pass";
  static final USER_COLUMN_MOB_NO="mob_no";
  static final USER_COLUMN_GENDER="gender";



  Future<Database> getDb()async{
    if(_database!=null){
      return _database!;
    }else{
      _database=await initDb();
      return _database!;
    }
  }


  Future<Database> initDb()async {
    Directory documentDirectory=await getApplicationDocumentsDirectory();
    var dbPath=join(documentDirectory.path,"expenseDB.db");

    return openDatabase(
        dbPath,
        version: 1,
        onCreate: (db,version){
          db.execute("create table $EXPENSE_TABLE($EXPENSE_COLUMN_ID integer primary key autoincrement,$USER_COLUMN_ID integer,$EXPENSE_COLUMN_TITLE text,$EXPENSE_COLUMN_DESC text,$EXPENSE_COLUMN_AMT real,$EXPENSE_COLUMN_BAL real,$EXPENSE_COLUMN_TYPE integer,$EXPENSE_COLUMN_CAT_ID integer,$EXPENSE_COLUMN_TIME string)");
          db.execute("create table $USER_TABLE($USER_COLUMN_ID integer primary key autoincrement,$USER_COLUMN_EMAIL text unique,$USER_COLUMN_PASS text,$USER_COLUMN_GENDER text,$USER_COLUMN_MOB_NO text)");

        }
    );
  }


  //User Operations

  Future<bool> checkIfEmailAlreadyExist(String email)async{
    var db=await getDb();
    var data= await db.query(USER_TABLE,where:"$USER_COLUMN_EMAIL=?",whereArgs: [email] );
    print("1] data: $data");
    return data.isNotEmpty;

  }





  Future<bool> createAccount(UserModel newUser)async{
    var check=await checkIfEmailAlreadyExist(newUser.email);
    var db=await getDb();
    print("2] check: $check");

    if(!check){
      var rowsInserted= await db.insert(USER_TABLE,newUser.toMap());
      print("3]RowsInserted:$rowsInserted");
      return rowsInserted>0;

    }else{
      return false;
    }

  }


  Future<bool> authenticateUser(String email,String pass)async{
    var db=await getDb();
    List<Map<String,dynamic>> data=await db.query(USER_TABLE,where: "$USER_COLUMN_EMAIL=? && $USER_COLUMN_PASS=?",whereArgs: [email,pass]);
    if(data.isNotEmpty){
      UserPreference().setUserId(data[0][USER_COLUMN_ID]);
    }
    return data.isNotEmpty;

  }


  //Expense Operations

Future<bool> addExpense(ExpenseModel newExpense)async{
    var db=await getDb();

    var rowsInserted=await db.insert(EXPENSE_TABLE,newExpense.toMap());
    return rowsInserted>0;
}


Future<List<ExpenseModel>> getAllExpensesOfUser()async{
    var db=await getDb();

    int uid= UserPreference().getUserId();

   List<Map<String,dynamic>> data=await db.query(EXPENSE_TABLE,where:" $USER_COLUMN_ID=?", whereArgs: [uid]);

   List<ExpenseModel> listExpense=[];

   for(Map<String,dynamic> eachExpense in data){
     /*var expense =await ExpenseModel.fromMap(eachExpense);
     listExpense.add(expense);*/
     listExpense.add(ExpenseModel.fromMap(eachExpense));
   }
   return listExpense;


}

  



}