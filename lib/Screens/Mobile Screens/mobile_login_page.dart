import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Providers/loading_provider.dart';
import 'package:mero_anime/Providers/error_message_provider.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_forgot_password_page.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_register_page.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';
import 'package:mero_anime/Widgets/error_message.dart';
import 'package:provider/provider.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  _MobileLoginPageState createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    final errorMessageProvider =
        Provider.of<ErrorMessageProvider>(context, listen: false);

    loadingProvider.setLoading(true);
    FirebaseAuthentication _auth = FirebaseAuthentication();
    bool checkLogin = await _auth.accountLogin(
        _emailTextEditingController.text, _passwordTextEditingController.text);
    loadingProvider.setLoading(false);

    if (checkLogin) {
      print(_auth.loginExceptionMessage);
    } else {
      errorMessageProvider.setErrorMessage(_auth.loginExceptionMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
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
                                builder: (context) =>
                                    MobileForgotPasswordPage()));
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
                    Consumer<LoadingProvider>(
                      builder: (context, loadingProvider, child) {
                        return MyButton(
                          text: 'Login',
                          isLoading: loadingProvider.isLoading,
                          onTap: () {
                            login(context);
                          },
                        );
                      },
                    ),

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
                                      builder: (context) =>
                                          MobileRegisterPage()));
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
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Consumer<ErrorMessageProvider>(
                builder: (context, errorMessageProvider, child) {
                  return IgnorePointer(
                    ignoring: !errorMessageProvider.showErrorMessage,
                    child:const  ErrorMessage(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}