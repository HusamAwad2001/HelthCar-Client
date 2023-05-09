import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const int primaryCode = 0xFF255ED6;
const primaryColor = Color(0xFF255ED6);
const textColor = Color(0xFF35364F);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);

const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.2),
  ),
);

// I will explain it later

const emailError = 'Enter a valid email address';
const requiredField = "This field is required";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'كلمة المرور مطلوبة'),
    MinLengthValidator(8, errorText: 'يجب أن تتكون كلمة المرور من 8 أرقام على الأقل'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'يجب أن تحتوي كلمات المرور على حرف واحد على الأقل')
  ],
);


