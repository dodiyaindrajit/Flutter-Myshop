import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/preference/preferences.dart';

const users = {
  'a@gmail.com': '123',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  BorderRadius inputBorder = BorderRadius.circular(30.0);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'My Shop',
      logo: const AssetImage("assets/images/logo.png"),
      onLogin: _authUser,
      onSignup: _signupUser,
      navigateBackAfterRecovery: true,
      initialAuthMode: AuthMode.login,
      scrollable: true,
      onSubmitAnimationCompleted: () async {
        await Preferences.setLogin(true);
        Navigator.pushReplacementNamed(context, "/animatedBar");
      },
      onRecoverPassword: _recoverPassword,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: Icons.home,
          label: 'Google',
          callback: () async {
            debugPrint('start google sign in');
            await Future.delayed(loginTime);
            debugPrint('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: Icons.ac_unit,
          label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
      ],
      additionalSignupFields: [
        UserFormField(
          keyName: 'first_name',
          displayName: 'First Name',
          userType: LoginUserType.name,
          fieldValidator: (value) {
            var nameRegExp = RegExp('^[A-Za-z]{3,25}\$');
            if (value != null && !nameRegExp.hasMatch(value)) {
              return "Enter Valid First Name";
            }
            return null;
          },
          icon: const Icon(Icons.person),
        ),
        UserFormField(
          keyName: 'last_name',
          displayName: 'Last Name',
          userType: LoginUserType.name,
          fieldValidator: (value) {
            var nameRegExp = RegExp('^[A-Za-z]{3,25}\$');
            if (value != null && !nameRegExp.hasMatch(value)) {
              return "Enter Valid Last Name";
            }
            return null;
          },
          icon: const Icon(Icons.person),
        ),
        UserFormField(
          keyName: 'mobile_number',
          displayName: 'Mobile Number',
          userType: LoginUserType.phone,
          fieldValidator: (value) {
            var phoneRegExp = RegExp('^([+]\\d{2})?\\d{10}\$');
            if (value != null && value.length < 10 && !phoneRegExp.hasMatch(value)) {
              return "Enter Valid Mobile Number";
            }
            return null;
          },
          icon: const Icon(Icons.call),
        )
      ],
      // messages: LoginMessages(
      //   userHint: 'User',
      //   passwordHint: 'Pass',
      //   confirmPasswordHint: 'Confirm',
      //   loginButton: 'LOG IN',
      //   signupButton: 'REGISTER',
      //   forgotPasswordButton: 'Forgot huh?',
      //   recoverPasswordButton: 'HELP ME',
      //   goBackButton: 'GO BACK',
      //   confirmPasswordError: 'Not match!',
      //   recoverPasswordDescription:
      //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      //   recoverPasswordSuccess: 'Password rescued successfully',
      // ),
      theme: LoginTheme(
        primaryColor: ColorConstants.kDarkGreen,
        titleStyle: const TextStyle(
          color: ColorConstants.kPrimaryColor,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
        ),
        textFieldStyle: const TextStyle(color: ColorConstants.kDarkGreen, fontSize: 18),
        bodyStyle: const TextStyle(
          color: ColorConstants.kBlack,
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: ColorConstants.kPrimaryColor,
        ),
        inputTheme: InputDecorationTheme(
          // filled: true,
          // fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          labelStyle: const TextStyle(fontSize: 15, color: ColorConstants.kBlack),
          hintStyle: const TextStyle(fontSize: 15, color: ColorConstants.kBlack),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: inputBorder,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstants.kDarkGreen, width: 3),
            borderRadius: inputBorder,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 3),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstants.kDarkGreen, width: 3),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: const LoginButtonTheme(
          backgroundColor: ColorConstants.kDarkGreen,
          highlightColor: ColorConstants.kBlack,
          elevation: 5.0,
          highlightElevation: 6.0,
        ),
      ),
    );
  }
}
