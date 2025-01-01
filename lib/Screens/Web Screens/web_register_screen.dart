import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Providers/error_message_provider.dart';
import 'package:mero_anime/Providers/loading_provider.dart';
import 'package:mero_anime/Widgets/error_message.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class WebRegisterScreen extends StatefulWidget {
  const WebRegisterScreen({super.key});

  @override
  State<WebRegisterScreen> createState() => _WebRegisterScreenState();
}

class _WebRegisterScreenState extends State<WebRegisterScreen> {
  final TextEditingController _userNameTextEditingController =
      TextEditingController();

  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  Future<bool> register(BuildContext context) async {
    final errorProvider =
        Provider.of<ErrorMessageProvider>(context, listen: false);
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    loadingProvider.setLoading(true);
    FirebaseAuthentication _auth = FirebaseAuthentication();
    bool checkRegister = await _auth.accountRegister(
        _emailTextEditingController.text, _passwordTextEditingController.text);
    loadingProvider.setLoading(false);
    if (checkRegister) {
      print(_auth.registerExceptionMessage);
      _emailTextEditingController.clear();
      _passwordTextEditingController.clear();
      _userNameTextEditingController.clear();
      return true;
    } else {
      print(_auth.registerExceptionMessage);
      errorProvider.setErrorMessage(_auth.registerExceptionMessage);
      return false;
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
                  // picture or icon of login
                  Image.asset(
                    'lib/Assets/Images/luffyImage.png',
                    height: 200,
                  ),
                  // welcome back message
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text("Let's create an account for you !!"),
                  // gapping
                  SizedBox(
                    height: height * 0.05,
                  ),

                  // username
                  MyTextfield(
                    hintText: 'Username',
                    obscureText: false,
                    controller: _userNameTextEditingController,
                  ),
                  SizedBox(
                    height: height * 0.01,
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                  // login button
                  Consumer<LoadingProvider>(builder: (context, value, child) {
                    return MyButton(
                        text: 'Register',
                        isLoading: value.isLoading,
                        onTap: () async {
                          Future<bool> changePage = register(context);
                          if (await changePage) {
                            Navigator.pop(context);
                          }
                        });
                  }),
                  SizedBox(
                    height: height * 0.04,
                  ),

                  // or continue with text
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
                          const Text(' Or register with '),
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
                    height: height * 0.02,
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
                    height: height * 0.04,
                  ),
                  // register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a Member ? '),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
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
            left: 0,
            right: 0,
            child: Consumer<ErrorMessageProvider>(
              builder: (context, errorMessageProvider, child) {
                return IgnorePointer(
                  ignoring: !errorMessageProvider.showErrorMessage,
                  child: const Center(
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
