import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_forgot_password_page.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_register_page.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';

class MobileLoginPage extends StatelessWidget {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  void login() async {
    FirebaseAuthentication _auth = FirebaseAuthentication();
    bool checkLogin = await _auth.accountLogin(
        _emailTextEditingController.text, _passwordTextEditingController.text);
    if (checkLogin) {
      print(_auth.loginExceptionMessage);
    } else {
      print(_auth.loginExceptionMessage);
    }
  }

  MobileLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // picture or icon of login
                Image.asset(
                  'lib/Assets/Images/chopperImage.png',
                  height: 200,
                ),
                // welcome back message
                SizedBox(
                  height: height * 0.01,
                ),
                const Text('Welcome Back You Have Been Missed !!'),
                // gapping
                SizedBox(
                  height: height * 0.07,
                ),
                // user  email
                MyTextfield(
                  hintText: 'Email',
                  obscureText: false,
                  controller: _emailTextEditingController,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                // user password
                MyTextfield(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _passwordTextEditingController,
                ),
                // forgot password

                SizedBox(
                  height: height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobileForgotPasswordPage()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot Password ?',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                // login button
                MyButton(text: 'Login', onTap: () {
                  login();
                }),
                SizedBox(
                  height: height * 0.05,
                ),

                // or continue with text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const Text(' Or continue with '),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),

                // google logo and twitter logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Logo
                    Image.asset(
                      'lib/Assets/Images/google.png',
                      height: 70,
                    ),
                    SizedBox(
                      width: width * 0.0244,
                    ),
                    // facebook Logo
                    Image.asset(
                      'lib/Assets/Images/facebook.png',
                      height: 70,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                // register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a Member ? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobileRegisterPage()));
                        },
                        child: const Text(
                          ' Register here',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
