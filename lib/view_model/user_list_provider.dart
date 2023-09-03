import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/model/models/user_list.dart';
import 'package:mvvm_with_provider/model/services/api_response.dart';

import '../model/repository/repository.dart';
import '../utils/common_toast.dart';

class UserListProvider with ChangeNotifier{

  final _appRepository = AppRepository();


  ApiResponse<UserList> userList = ApiResponse.loading();
  setUserList(ApiResponse<UserList> response){
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserList()async{
    setUserList(ApiResponse.loading());
    _appRepository.userList().then((value){

      setUserList(ApiResponse.complete(value));

    }).onError((error, stackTrace){
      commonToast("Something went wrong");
      setUserList(ApiResponse.error(error.toString()));
      print(error);

    });
  }

}