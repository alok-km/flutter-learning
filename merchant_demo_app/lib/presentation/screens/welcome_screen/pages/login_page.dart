import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/welcome_screen_controller.dart';
import 'package:merchant_demo_app/models/login.dart';
import 'package:merchant_demo_app/presentation/screens/home/home_screen.dart';
import 'package:merchant_demo_app/components/text_field_with_hint_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  WelcomeScreenX welcomeScreenX = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/login-screen-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Container(
                    height: 150.0,
                    width: 190.0,
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Image.asset(
                          'lib/assets/images/merchant_app_icon.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Log in into your account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    hint: "Enter your username",
                    label: "Username",
                    formKey: welcomeScreenX.usernameKey,
                    controller: welcomeScreenX.usernameX,
                    obscureText: false,
                  ),
                  CustomTextFormField(
                    hint: "Enter your password",
                    label: "Password",
                    formKey: welcomeScreenX.userpwdKey,
                    controller: welcomeScreenX.userpwdX,
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {});
                        if (welcomeScreenX.usernameKey.currentState!
                            .validate()) {
                          welcomeScreenX.usernameFlag = true;
                        }
                        if (welcomeScreenX.userpwdKey.currentState!
                            .validate()) {
                          welcomeScreenX.userpwdFlag = true;
                        }
                        if (welcomeScreenX.usernameFlag &&
                            welcomeScreenX.userpwdFlag) {
                          var response = await login(
                              welcomeScreenX.usernameX.text,
                              welcomeScreenX.userpwdX.text,
                              welcomeScreenX.deviceToken);
                          if (response["status"] == "Success") {
                            Fluttertoast.showToast(
                              msg: "Successfully logged in",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        }
                      },
                    ),
                  ),
                  Spacer(flex: 2)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
