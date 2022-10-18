import 'package:flutter/material.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/view/signupcontroller.dart';
import 'package:jobizy/app/view/widgets/custombut.dart';
import 'package:jobizy/app/view/widgets/textformfield.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: provider.signupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/business-3d-man-making-a-task-list-on-his-phone.png',
                  height: 200,
                  width: 200,
                )),
                const Text(
                  'Full name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  hiddentext: false,
                  icon: Icons.person_outline_rounded,
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.userNameController,
                  validatorErrorMessage: "Please enter Name",
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
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.emailController,
                  validatorErrorMessage: "Please enter Email",
                ),
                kheight20,
                const Text(
                  'Moblie',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  hiddentext: false,
                  icon: Icons.phone_android_outlined,
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.mobileController,
                  validatorErrorMessage: "Please enter Mobile Number",
                ),
                kheight20,
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                Consumer<SignupController>(
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
                      color: kGrey,
                      radius: 10,
                      iconcolor: kBlack,
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
                      checkColor: kWhite,
                      activeColor: const Color.fromARGB(255, 99, 100, 100),
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
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            fontSize: 15,
                            color: mainColor,
                          ),
                        ))
                  ],
                ),
                kheight20,
                Center(
                  child: CustomButton(
                    borderColor: mainColor,
                    buttonColor: mainColor,
                    text: 'Sign Up',
                    width: 300,
                    height: 70,
                    fontsize: 20,
                    ontap: () {
                      provider.registerButton(context);
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
                      "You have an account ?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          RouteNavigator.popRoute(context);
                        },
                        child: const Text(
                          'Sign in',
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
