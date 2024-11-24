import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/app_styles.dart';
import 'package:todo/core/utils/emailValidation.dart';
import 'package:todo/core/utils/routes_manager.dart';
import 'package:todo/presentation/screens/auth/Widgets/Custom_Field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController? emailController ;


   TextEditingController? passwordController ;



  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
     passwordController = TextEditingController();
  }

  @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //
  // }

  @override
  Widget build(BuildContext context) {
   print (emailController?.text);
   print (passwordController?.text);


    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image.asset(
                //   AssetsManager.splash,
                // ),
                SizedBox(height: 12.h),
                Text(
                  'E-mail',
                ),
                SizedBox(height: 12.h),
                CustomField(
                  hintText: 'Enter your email address',
                 keyBoardType: TextInputType.emailAddress,
                 // controller: emailController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter email';
                    }
                    if (!isValidEmail(input)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                Text(
                  'Password',

                ),
                SizedBox(height: 12.h),
                CustomField(
                  hintText: 'Enter your password',
                  keyBoardType: TextInputType.visiblePassword,
                  controller: passwordController,
                 isSecure: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                MaterialButton(
                  padding: REdgeInsets.symmetric(vertical: 11),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  onPressed: () {
                  //  signIn();
                  },
                  child: Text(
                    'Sign-In',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.pushReplacementNamed(
                         context, RoutesManager.register);
                      },
                      child: Text(
                        'Create account',
                        style: AppLightStyles.hintStyle?.copyWith(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
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
