import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_authentication.dart';
import 'package:mero_anime/Providers/error_message_provider.dart';
import 'package:mero_anime/Providers/loading_provider.dart';
import 'package:mero_anime/Widgets/error_message.dart';
import 'package:mero_anime/Widgets/my_button.dart';
import 'package:mero_anime/Widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class MobileForgotPasswordPage extends StatefulWidget {
  const MobileForgotPasswordPage({super.key});

  @override
  State<MobileForgotPasswordPage> createState() =>
      _MobileForgotPasswordPageState();
}

class _MobileForgotPasswordPageState extends State<MobileForgotPasswordPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final FirebaseAuthentication auth = FirebaseAuthentication();
  bool lightColor = false;

  Future<void> sendLink(BuildContext context) async {
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    final errorMessageProvider =
        Provider.of<ErrorMessageProvider>(context, listen: false);
    loadingProvider.setLoading(true);
    bool check = await auth.forgotPassword(_emailTextEditingController.text);
    loadingProvider.setLoading(false);
    if (check) {
      lightColor = true;
      errorMessageProvider
          .setErrorMessage('Password reset link sent to your email');
      _emailTextEditingController.clear();
    } else {
      lightColor = false;
      errorMessageProvider.setErrorMessage(auth.resetPasswordExceptionMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                // Forgot password text
                Padding(
                  padding: const EdgeInsets.only(right: 100),
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
                SizedBox(
                  height: height * 0.02,
                ),
                // logo or picture
                Image.asset(
                  'lib/Assets/Images/zoroImage.png',
                  height: 200,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                // text
                const Text(
                    'Enter your email and we will send you reset password link !'),
                SizedBox(
                  height: height * 0.02,
                ),
                // text field
                MyTextfield(
                    hintText: 'Email',
                    obscureText: false,
                    controller: _emailTextEditingController),
                SizedBox(
                  height: height * 0.04,
                ),
                // send Link Button
                Consumer<LoadingProvider>(builder: (context, value, child) {
                  return MyButton(
                    text: 'Send link ',
                    onTap: () {
                      sendLink(context);
                    },
                    isLoading: value.isLoading,
                  );
                }),
                SizedBox(
                  height: height * 0.07,
                ),
                // Error message
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Consumer<ErrorMessageProvider>(
                    builder: (context, errorMessageProvider, child) {
                      return IgnorePointer(
                        ignoring: !errorMessageProvider.showErrorMessage,
                        child: lightColor
                            ? ErrorMessage(
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                                textColor: Theme.of(context).colorScheme.primary,
                              )
                            : const ErrorMessage(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}