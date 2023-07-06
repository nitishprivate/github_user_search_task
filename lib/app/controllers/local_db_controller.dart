import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/model/user_model.dart';

class LocalDbController extends GetxController {
  List<UserModel> userModelList = [];
  SharedPreferences? preferences;
  @override
  void onInit() {
    initPref();
    super.onInit();
  }

  final String userDataListKey = "userDataListKey";

  Future<void> initPref() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  Future<List<UserModel>> getUserFromLocalDB() async {
    initPref();
    var resp = preferences!.get(userDataListKey);
    if (resp != null && resp is String) {
      userModelList.clear();
      userModelList.addAll((await jsonDecode(resp) as List<dynamic>).map((e) => UserModel.fromJson(e)).toList());
    }
    return userModelList;
  }

  Future<bool> addUserInList(UserModel model) async {
    if (userModelList.firstWhereOrNull((element) => element.id == model.id) == null) {
      userModelList.add(model);
      await saveUserList();
      print(userModelList.length);
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveUserList() async {
    await initPref();
    await preferences?.setString(userDataListKey, jsonEncode(userModelList.map((e) => e.toJson()).toList()));
  }
}
