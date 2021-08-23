import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:merchant_demo_app/presentation/screens/welcome_screen/components/text_field_with_hint_text.dart';
import 'package:merchant_demo_app/presentation/screens/welcome_screen/pages/login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final ecGatewayDevIDController = TextEditingController();
  final custIDController = TextEditingController();
  final merchantIDController = TextEditingController();
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();
  final endToEndIDController = TextEditingController();
  bool _validateEcGatewayDevId = false;
  bool _validateCustID = false;
  bool _validateMerchantID = false;
  bool _validateUserID = false;
  bool _validatePassword = false;
  bool _validateEndToEndID = false;
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
                        TextFieldWithHintText(
                          label: "EC Gateway Device ID",
                          hint: "Enter EC Gateway Device ID",
                          validateText: _validateEcGatewayDevId,
                        ),
                        TextFieldWithHintText(
                          label: "Customer ID",
                          hint: "Enter Customer ID",
                          validateText: _validateCustID,
                        ),
                        TextFieldWithHintText(
                          label: "Merchant ID",
                          hint: "Enter Merchant ID",
                          validateText: _validateMerchantID,
                        ),
                        TextFieldWithHintText(
                          label: "User ID",
                          hint: "Enter User ID",
                          validateText: _validateUserID,
                        ),
                        TextFieldWithHintText(
                          label: "Password",
                          hint: "Enter Password",
                          validateText: _validatePassword,
                        ),
                        TextFieldWithHintText(
                          label: "End To End ID",
                          hint: "Enter End To End ID",
                          validateText: _validateEndToEndID,
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
                            onPressed: () {
                              setState(() {
                                ecGatewayDevIDController.text.isEmpty
                                    ? _validateEcGatewayDevId = true
                                    : _validateEcGatewayDevId = false;
                                custIDController.text.isEmpty
                                    ? _validateCustID = true
                                    : _validateCustID = false;
                                merchantIDController.text.isEmpty
                                    ? _validateMerchantID = true
                                    : _validateMerchantID = false;
                                userIDController.text.isEmpty
                                    ? _validateUserID = true
                                    : _validateUserID = false;
                                passwordController.text.isEmpty
                                    ? _validatePassword = true
                                    : _validatePassword = false;
                                endToEndIDController.text.isEmpty
                                    ? _validateEndToEndID = true
                                    : _validateEndToEndID = false;
                              });
                              if (!_validateEcGatewayDevId &&
                                  !_validateCustID &&
                                  !_validateMerchantID &&
                                  !_validateUserID &&
                                  !_validatePassword &&
                                  !_validateEndToEndID) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
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
