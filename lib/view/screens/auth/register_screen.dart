import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/constants/app_styles.dart';
import 'package:helth_care_client/controllers/auth_controller.dart';
import 'package:helth_care_client/view/screens/auth/login_screen.dart';

import '../../../../constants/constants.dart';
import 'components/register_form.dart';

class RegisterScreen extends GetView<AuthController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          "assets/icons/Sign_Up_bg.svg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          // Now it takes 100% of our height
        ),
        // Container(color: Colors.white.withOpacity(0.2)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: GetBuilder<AuthController>(
            builder: (_) {
              return Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding),
                        Text(
                          "إنشاء حساب",
                          style: getBoldStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "هل لديك حساب بالفعل؟",
                              style: getRegularStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  )),
                              child: Text(
                                "تسجيل الدخول!",
                                style: getBoldStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        RegisterForm(formKey: _formKey),
                        const SizedBox(height: defaultPadding),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                await controller.register();
                                _formKey.currentState!.save();
                              }
                            },
                            child: Text(
                              "سجل الآن",
                              style: getBoldStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
