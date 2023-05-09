import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/controllers/auth_controller.dart';
import 'package:helth_care_client/view/screens/auth/register_screen.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/constants.dart';
import 'components/login_form.dart';

class LoginScreen extends GetView<AuthController> {
  // It's time to validat the text field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // But still same problem, let's fixed it
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          "assets/icons/Sign_Up_bg.svg",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // Now it takes 100% of our height
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تسجيل الدخول",
                      style: getBoldStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text("ليس لديك حساب؟",style: getRegularStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ),
                          child: Text(
                            "سجل الآن!",
                            style: getBoldStyle(
                              color: primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    LoginForm(formKey: _formKey),
                    const SizedBox(height: defaultPadding * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login();
                            _formKey.currentState!.save();
                            //  Sign in also done
                          }
                        },
                        child: Text("تسجيل الدخول",style: getBoldStyle(fontSize: 15),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
