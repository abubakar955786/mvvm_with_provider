import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/app_colors.dart';
import 'package:mvvm_with_provider/utils/common_toast.dart';
import 'package:mvvm_with_provider/view_model/login_provider.dart';
import 'package:provider/provider.dart';


class LogInScreen extends StatefulWidget {
  final Map args;
  const LogInScreen({super.key, required this.args});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final logInProvider =  Provider.of<LogInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(widget.args['title'].toString(), style: TextStyle(color: whiteColor),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Enter email",
              ),
            ),

            const SizedBox(height: 10,),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                hintText: "Enter password",
              ),
            ),


            const SizedBox(height: 30),

            SizedBox(
              height: 50,width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    if(email.text.isEmpty){
                      commonToast("Please enter email");
                    }else if(password.text.isEmpty){
                      commonToast("Please enter password");
                    }else{
                      Map data=  {
                        "email": email.text.toString(),
                        "password": password.text.toString()
                      };
                      logInProvider.useLogIn(data, context);
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor
                  ),
                  child: logInProvider.isLoading?CircularProgressIndicator(color: whiteColor,): const Text("LogIn")),
            )
          ],
        ),
      ),
    );
  }
}
