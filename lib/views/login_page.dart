import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/views/home_page.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController _logincontroller = Get.put(LoginController());

    return Scaffold(
        appBar: null,
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(labelText: "Username"),
                  controller: _logincontroller.mailController,
                ),
                width: 200,
                height: 100,
              ),
              SizedBox(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  controller: _logincontroller.passController,
                ),
                width: 200,
                height: 100,
              ),
              ElevatedButton(onPressed: ()=> _logincontroller.sessionCall(), child: Text("Login")),
              ElevatedButton(onPressed: ()=> Get.to(HomePage()), child: Text("Login as Guest"))
            ],
          ),
        ));
  }
}
