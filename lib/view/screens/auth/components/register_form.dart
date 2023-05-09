import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:helth_care_client/constants/app_styles.dart';
import 'package:helth_care_client/controllers/auth_controller.dart';

import '../../../../../constants/constants.dart';

class RegisterForm extends GetView<AuthController> {
  RegisterForm({
    Key? key,
    required this.formKey,
  });

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (logic) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFieldName(text: "الإسم الأول"),
              TextFormField(
                controller: controller.firstNameController,
                decoration: InputDecoration(
                  hintText: "حسام",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                validator: RequiredValidator(errorText: "اسم المستخدم مطلوب"),
                style: getLightStyle(
                  color: Colors.black,
                ),
                // Let's save our username
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "الإسم الثاني"),
              TextFormField(
                controller: controller.secondNameController,
                decoration: InputDecoration(
                  hintText: "عوض",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                validator: RequiredValidator(errorText: "اسم المستخدم مطلوب"),
                style: getLightStyle(
                  color: Colors.black,
                ),
                // Let's save our username
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "اسم العائلة"),
              TextFormField(
                controller: controller.familyNameController,
                decoration: InputDecoration(
                  hintText: "دهليز",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                validator: RequiredValidator(errorText: "اسم المستخدم مطلوب"),
                style: getLightStyle(
                  color: Colors.black,
                ),
                // Let's save our username
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "البريد الإلكتروني"),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "husam@email.com",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                style: getLightStyle(
                  color: Colors.black,
                ),
                validator:
                    EmailValidator(errorText: "تأكد من البريد الإلكتروني!"),
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "رقم الهاتف"),
              TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "0595026281",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                style: getLightStyle(
                  color: Colors.black,
                ),
                validator: RequiredValidator(errorText: "رقم الهاتف مطلوب"),
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "العنوان"),
              TextFormField(
                controller: controller.addressController,
                decoration: InputDecoration(
                  hintText: "رفح / شارع الإمام علي",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                validator: RequiredValidator(errorText: "اسم المستخدم مطلوب"),
                style: getLightStyle(
                  color: Colors.black,
                ),
                // Let's save our username
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "تاريخ الميلاد"),
              TextFormField(
                controller: controller.birthDateController,
                decoration: InputDecoration(
                  hintText: "13/12/2001",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                validator: RequiredValidator(errorText: "اسم المستخدم مطلوب"),
                style: getLightStyle(
                  color: Colors.black,
                ),
                // Let's save our username
              ),
              const SizedBox(height: defaultPadding),
              //
              const TextFieldName(text: "كلمة المرور"),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "******",
                  hintStyle: getLightStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                style: getLightStyle(
                  color: Colors.black,
                ),
              ),
              // const SizedBox(height: defaultPadding),
              //
              // const TextFieldName(text: "تأكيد كلمة المرور"),
              // TextFormField(
              //   controller: controller.passwordController,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     hintText: "*****",
              //     hintStyle: getLightStyle(
              //       color: Colors.black54,
              //       fontSize: 13,
              //     ),
              //   ),
              //   style: getLightStyle(
              //     color: Colors.black,
              //   ),
              //   validator: (pass) =>
              //       MatchValidator(errorText: "كلمة السر غير مطابقة")
              //           .validateMatch(pass!, _password),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: getSemiBoldStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
      ),
    );
  }
}
