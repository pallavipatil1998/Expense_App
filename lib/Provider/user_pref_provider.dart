import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefProvider extends ChangeNotifier{
  static const User_KEY_ID="u_id";
  int _uid =0;

  void setUid(int muid)async{
    var pref=await SharedPreferences.getInstance();
    pref.setInt(User_KEY_ID, muid);
    _uid=muid;
    notifyListeners();
  }

  getUid()async{
    var pref=await SharedPreferences.getInstance();
    int? muid=pref.getInt(User_KEY_ID);
    _uid =muid! ?? 0;
    notifyListeners();
  }

  getID(){
    return _uid;
  }

}