import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:merchant_demo_app/controllers/welcome_screen_controller.dart';
import 'package:merchant_demo_app/components/text_field_with_hint_text.dart';
import 'package:merchant_demo_app/models/device_registration.dart';
import 'package:merchant_demo_app/presentation/screens/welcome_screen/pages/login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  WelcomeScreenX welcomeScreenX = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: size.height, minWidth: size.width),
          child: IntrinsicHeight(
            child: Container(
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
                        CustomTextFormField(
                          label: "EC Gateway Device ID",
                          hint: "Enter EC Gateway Device ID",
                          formKey: welcomeScreenX.ecGatewayDevKey,
                          controller: welcomeScreenX.ecGatewayDevIDX,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          label: "Customer ID",
                          hint: "Enter Customer ID",
                          formKey: welcomeScreenX.custIDKey,
                          controller: welcomeScreenX.custIDX,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          label: "Merchant ID",
                          hint: "Enter Merchant ID",
                          formKey: welcomeScreenX.merchantIDKey,
                          controller: welcomeScreenX.merchantIDX,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          label: "User ID",
                          hint: "Enter User ID",
                          formKey: welcomeScreenX.userIDKey,
                          controller: welcomeScreenX.userIDX,
                          obscureText: false,
                        ),
                        CustomTextFormField(
                          label: "Password",
                          hint: "Enter Password",
                          formKey: welcomeScreenX.pwdKey,
                          controller: welcomeScreenX.pwdX,
                          obscureText: true,
                        ),
                        CustomTextFormField(
                          label: "End To End ID",
                          hint: "Enter End To End ID",
                          formKey: welcomeScreenX.endToEndIDKey,
                          controller: welcomeScreenX.endToEndIDX,
                          obscureText: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {});
                              if (welcomeScreenX.ecGatewayDevKey.currentState!
                                  .validate()) {
                                welcomeScreenX.ecGatewayDevFlag = true;
                              }
                              if (welcomeScreenX.custIDKey.currentState!
                                  .validate()) {
                                welcomeScreenX.custIDFlag = true;
                              }
                              if (welcomeScreenX.merchantIDKey.currentState!
                                  .validate()) {
                                welcomeScreenX.merchantIDFlag = true;
                              }
                              if (welcomeScreenX.userIDKey.currentState!
                                  .validate()) {
                                welcomeScreenX.userIDFlag = true;
                              }
                              if (welcomeScreenX.pwdKey.currentState!
                                  .validate()) {
                                welcomeScreenX.pwdFlag = true;
                              }
                              if (welcomeScreenX.endToEndIDKey.currentState!
                                  .validate()) {
                                welcomeScreenX.endToEndIDFlag = true;
                              }
                              if (welcomeScreenX.ecGatewayDevFlag &&
                                  welcomeScreenX.custIDFlag &&
                                  welcomeScreenX.merchantIDFlag &&
                                  welcomeScreenX.userIDFlag &&
                                  welcomeScreenX.pwdFlag &&
                                  welcomeScreenX.endToEndIDFlag) {
                                var response = await deviceRegistration(
                                  welcomeScreenX.ecGatewayDevIDX.text,
                                  welcomeScreenX.custIDX.text,
                                  welcomeScreenX.merchantIDX.text,
                                  welcomeScreenX.userIDX.text,
                                  welcomeScreenX.pwdX.text,
                                  welcomeScreenX.endToEndIDX.text,
                                );
                                if (response["status"] == "Success") {
                                  Fluttertoast.showToast(
                                    msg: "Successfully created account",
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
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
          ),
        ),
      ),
    );
  }
}
