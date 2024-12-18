import 'package:flutter/material.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';
class WebForgotPasswordPage extends StatefulWidget{
  const WebForgotPasswordPage({super.key});

  @override
  State<WebForgotPasswordPage> createState() => _WebForgotPasswordPageState();
}

class _WebForgotPasswordPageState extends State<WebForgotPasswordPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        
      ),
      
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height*0.02,),
              // Forgot password text
              Padding(
                padding: const EdgeInsets.only(right: 350),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
              ),
               SizedBox(height: height*0.02,),
              // logo or picture
              Image.asset(
                'lib/Assets/Images/zoroImage.png',
                height: 200,
              ),
               SizedBox(height: height*0.04,),
              // text
              const Text(
                  'Enter your email and we will send you reset password link !'),
                SizedBox(height: height*0.02,),
              // text field
              MyTextfield(
                  hintText: 'Email',
                  obscureText: false,
                  controller: _emailTextEditingController),
               SizedBox(height: height*0.04,),
              // send Link Button
              MyButton(text: 'Send link ', onTap: () {})
            ],
          ),
        ),
      ),
    ));
  }
}