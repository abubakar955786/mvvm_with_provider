import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_provider/app_store/app_store.dart';
import 'package:mvvm_with_provider/model/repository/repository.dart';
import 'package:mvvm_with_provider/routes/name_routes.dart';
import 'package:mvvm_with_provider/utils/common_toast.dart';

class LogInProvider with ChangeNotifier{
  final _appRepository = AppRepository();


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> useLogIn(dynamic data, BuildContext context)async{
    setLoading(true);
    _appRepository.userLogIn(data).then((value){

      if(value['token'] ==''){
        commonToast("Something went wrong");
      }else{
        Navigator.pushNamed(context, RouteName.homeScreen);
      }

      print(value['token']);
      AppStore().setUserToken(value['token']);
      setLoading(false);

    }).onError((error, stackTrace){
      commonToast("Something went wrong");
      print(error);
      setLoading(false);
    });
  }

}