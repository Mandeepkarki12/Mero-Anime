import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Providers/error_message_provider.dart';
import 'package:mero_anime/Providers/loading_provider.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_forgot_password_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_register_screen.dart';
import 'package:mero_anime/Widgets/error_message.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class WebLoginScreen extends StatefulWidget {
  const WebLoginScreen({super.key});

  @override
  _WebLoginScreenState createState() => _WebLoginScreenState();
}

class _WebLoginScreenState extends State<WebLoginScreen> {
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
        child: Stack(children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login icon
                  Image.asset(
                    'lib/Assets/Images/chopperImage.png',
                    height: 200,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text('Welcome Back You Have Been Missed !!'),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  // Email field
                  MyTextfield(
                    hintText: 'Email',
                    obscureText: false,
                    controller: _emailTextEditingController,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  // Password field
                  MyTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordTextEditingController,
                  ),
                  // Forgot password below password field, aligned right
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Action for forgot password
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WebForgotPasswordPage()));
                          },
                          child: const Text(
                            'Forgot Password?',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  // Login button
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
                    height: height * 0.03,
                  ),
                  // Or continue with text
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Padding(
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
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  // Google and Facebook logos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/Assets/Images/google.png',
                        height: 70,
                      ),
                      SizedBox(
                        width: width * 0.0244,
                      ),
                      Image.asset(
                        'lib/Assets/Images/facebook.png',
                        height: 70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a Member? '),
                      GestureDetector(
                        onTap: () {
                          // Register action
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebRegisterScreen()));
                        },
                        child: const Text(
                          ' Register here',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Consumer<ErrorMessageProvider>(
              builder: (context, errorMessageProvider, child) {
                return IgnorePointer(
                  ignoring: !errorMessageProvider.showErrorMessage,
                  child:const  Center(
                    child: ErrorMessage(
                      fixedWidth: 400, // Set desired width for the ErrorMessage
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
