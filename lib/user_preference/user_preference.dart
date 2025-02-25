import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static const USER_KEY_ID="u_id";

  void setUserId( int uid)async{
    var pref=await SharedPreferences.getInstance();
    pref.setInt(USER_KEY_ID, uid);
  }


  getUserId()async{
    var pref=await SharedPreferences.getInstance();
    int? uid= pref.getInt(USER_KEY_ID);
    return uid ?? 0 ;
  }

}