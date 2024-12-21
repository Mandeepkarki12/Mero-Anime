import 'package:flutter/material.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_forgot_password_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_register_screen.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';

class WebLoginScreen extends StatelessWidget {
  WebLoginScreen({super.key});
  

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>WebForgotPasswordPage()));
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
                MyButton(text: 'Login', onTap: () {}),
                SizedBox(
                  height: height * 0.03,
                ),
                // Or continue with text
                ConstrainedBox(
                  constraints:const  BoxConstraints(
                    maxWidth: 500
                  ),
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>WebRegisterScreen()));
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
      ),
    );
  }
}
