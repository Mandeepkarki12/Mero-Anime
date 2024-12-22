import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';

class WebRegisterScreen extends StatelessWidget {
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  Future<bool> register() async {
    FirebaseAuthentication _auth = FirebaseAuthentication();
    bool checkRegister = await _auth.accountRegister(
        _emailTextEditingController.text, _passwordTextEditingController.text);
    if (checkRegister) {
      print(_auth.registerExceptionMessage);
      _emailTextEditingController.clear();
      _passwordTextEditingController.clear();
      _userNameTextEditingController.clear();
      return true;
    } else {
      print(_auth.registerExceptionMessage);
      return false;
    }
  }

  WebRegisterScreen({super.key});
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
                MyButton(
                    text: 'Register',
                    onTap: () async {
                      Future<bool> changePage = register();
                      if (await changePage) {
                        Navigator.pop(context);
                      }
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
                        onTap: () {},
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
      ),
    );
  }
}
