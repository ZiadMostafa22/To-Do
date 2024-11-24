import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/assets_manager.dart';
import 'package:todo/core/utils/emailValidation.dart';
import 'package:todo/presentation/screens/auth/Widgets/Custom_Field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController fullNameController;

  late TextEditingController userNameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController rePasswordController;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsManager.base,
                  width: 237.w,
                  height: 71.h,
                ),
                Text(
                  'Full name',
                  //   style: AppLightStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomField(
                  hintText: 'enter your full name',
                  keyBoardType: TextInputType.name,
                  controller: fullNameController,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return 'Plz, enter full name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'user name',

                  ///   style: AppLightStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomField(
                  hintText: 'enter user name',
                  keyBoardType: TextInputType.name,
                  controller: userNameController,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return 'Plz, enter user name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'E-mail',
                  //  style: AppLightStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomField(
                  hintText: 'enter your email address',
                  keyBoardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return 'Plz, enter email';
                    }
                    if (!isValidEmail(input)) {
                      // true -> email is valid
                      return 'Email bad format';
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Password',
                  // style: AppLightStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomField(
                  hintText: 'enter your password',
                  keyBoardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  isSecure: true,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return 'Plz, enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  're-password',
                  //   style: AppLightStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomField(
                  hintText: 'Password confirmation',
                  keyBoardType: TextInputType.visiblePassword,
                  isSecure: true,
                  controller: rePasswordController,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return 'Plz, confirm password';
                    }
                    if (input != passwordController.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                MaterialButton(
                  padding: REdgeInsets.symmetric(vertical: 11),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  onPressed: () {
                    //    signUp();
                  },
                  child: Text(
                    'Sign-Up',
                    //  style: AppLightStyles.buttonTitle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",

                    ),
                    TextButton(
                        onPressed: () {
                          //  Navigator.pushReplacementNamed(
                          //    context, RoutesManager.login);
                        },
                        child: Text(
                          'Sign-In',
                          //   style: AppLightStyles.title?.copyWith(
                          //    fontSize: 14,
                          //    decoration: TextDecoration.underline),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp()
  {
    if (formKey.currentState?.validate()== false) return;
  }
}