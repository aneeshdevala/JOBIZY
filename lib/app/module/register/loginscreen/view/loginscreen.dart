import 'package:flutter/material.dart';
import 'package:jobizy/app/module/register/loginscreen/controller/logincontroller.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/register/signupscreen/view/signupscreen.dart';
import 'package:jobizy/app/module/homescreen/widgets/custombut.dart';
import 'package:jobizy/app/module/homescreen/widgets/textformfield.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninController>(context, listen: false);
    return Scaffold(
      //   backgroundColor: Colors.transparent,
      body: SafeArea(
        
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: provider.signinKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/business-3d-businessman-in-dark-blue-suit-waving-hello.png',
                        height: 200,
                      ),
                    ],
                  ),
                ),
                kheight20,
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  hiddentext: false,
                  icon: Icons.email_outlined,
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: mainColor,
                  radius: 10,
                  iconcolor: mainColor,
                  controller: provider.emailController,
                  validatorErrorMessage: "Please enter Email",
                ),
                kheight20,
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                Consumer<SigninController>(
                  builder: (context, value, child) {
                    return TextFormWidget(
                      sufixIcon: IconButton(
                          onPressed: () {
                            provider.isHidden = !provider.isHidden;
                          },
                          icon: Icon(
                            provider.isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kBlack,
                          )),
                      icon: Icons.lock_outline_rounded,
                      iconsize: 23,
                      textHeight: 15,
                      padding: 20,
                      color: mainColor,
                      radius: 10,
                      iconcolor: mainColor,
                      controller: provider.passwordController,
                      hiddentext: value.isHidden ? false : true,
                      validatorErrorMessage: "Please enter Password",
                    );
                  },
                ),
                kheight,
                Row(
                  children: [
                    Checkbox(
                      splashRadius: 10,
                      checkColor: mainColor,
                      activeColor: mainColor,
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password ?'))
                  ],
                ),
                kheight20,
                Center(
                  child: CustomButton(
                    borderColor: mainColor,
                    buttonColor: mainColor,
                    text: 'Login',
                    width: 300,
                    height: 70,
                    fontsize: 20,
                    ontap: () {
                      provider.loginButton(context);
                    },
                    color: kWhite,
                  ),
                ),
                kheight20,
                Center(
                  child: Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                      border: Border.all(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        kWidth20,
                        Image.network(
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                          height: 50,
                        ),
                        kWidth10,
                        const Text(
                          'Sign in with Google',
                          style: kTextStyle2,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You don't have an account yet?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          RouteNavigator.pushRoute(
                              context, const SignupScreen());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20, color: mainColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
