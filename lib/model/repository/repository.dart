import 'package:mvvm_with_provider/model/models/user_list.dart';
import 'package:mvvm_with_provider/model/services/network_services.dart';

class AppRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

   String baseUsl = "https://reqres.in";


   Future<dynamic> userLogIn(dynamic data)async{
     var response = await _apiServices.postApi("$baseUsl${"/api/login"}", data);

     try{
       return response;
     }catch (e){
       print(e.toString());
     }
   }


  Future<UserList?> userList()async{

    var response = await _apiServices.getApi("$baseUsl${"/api/users?page=2"}");

    try{
      return response = UserList.fromJson(response);
    }catch (e){
      print(e.toString());
    }
  }



}