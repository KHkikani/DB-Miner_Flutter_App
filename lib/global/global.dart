import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Database_Helper.dart';
import '../models/animalModel.dart';

class Global{


  static databaseCreate() async {
    allAnimals.forEach((e)  async {
      int res = await DBHelper.dbHelper.insertData(data : e);
      print(res);
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('initDB', true);
  }



}