import 'dart:io';
import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiver/strings.dart';
import 'package:season/src/app/controller/google_controller.dart';
import 'package:season/src/app/data/dio/exception/dio_error_extention.dart';
import 'package:season/src/app/data/models/user_model.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/provider/auth_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/bottom_sheet_camera.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/custom_snackbar.dart';
import 'package:season/src/view/widgets/defult_userImage.dart';
import 'package:season/src/view/widgets/loading.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/auth/pages/sign_in.dart';
import 'package:season/src/view/auth/widget/bottom_sheet_sucss.dart';
import 'package:season/src/view/widgets/text.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String? _name;
  String? _email;
  String? _password;
  File? _imageFile;
  bool _obscure = true;
  bool value = true;
  _submit() async {
    if (!_formKey.currentState!.validate()) {
      if (!_autoValidate) setState(() => _autoValidate = true);

      return;
    }

    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();
    try {
      LoadingScreen.show(context);
      print(_email);
      print(_name);
      print(_password);

      final UserModel user = UserModel(
        email: _email,
        name: _name,
      );
      await context.read<AuthProvider>().register(user, _password!);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (_) => const SigInPage(),
          ),
          (route) => false);
    } catch (e) {
      Navigator.pop(context);
      showCustomSnackBar(readableError(e), context, isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: defultblue,
        title: CustomText(
          text: "Register".trans,
        ),
        elevation: 0.1,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Appheight / 20,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (_imageFile != null)
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(_imageFile!),
                                ),
                              ),
                            )
                          : DefuletImageUser(),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.camera_alt),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CameraBottomSheet(
                                cameraOnpress: () {
                                  _getImage(ImageSource.camera);
                                },
                                galleryOnpress: () {
                                  _getImage(ImageSource.gallery);
                                },
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    MainTextField(
                      hint: 'User_Name'.trans,
                      onSubmit: (val) => _name = val,
                      validator: Validator(
                        rules: [
                          MinLengthRule(4,
                              validationMessage: 'username_validation'.trans),
                          RequiredRule(
                              validationMessage: 'username_validation'.trans),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Appheight / 25,
                    ),
                    MainTextField(
                      hint: 'Email'.trans,
                      onSubmit: (va) => _email = va,
                      validator: (email) {
                        if (isBlank(email)) {
                          return 'email_validation'.trans;
                        }
                        if (EmailChecker.isNotValid(email!)) {
                          return 'email_validation'.trans;
                        }
                      },
                    ),
                    SizedBox(
                      height: Appheight / 25,
                    ),
                    MainTextField(
                      obscureText: _obscure,
                      hint: 'Password'.trans,
                      onSubmit: (password) => _password = password,
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscure = !_obscure;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: _obscure
                              ? null
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      validator: Validator(
                        rules: [
                          MinLengthRule(8,
                              validationMessage: 'password_length'.trans),
                          RequiredRule(
                              validationMessage: 'password_validation'.trans),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Appheight / 20,
                    ),
                    GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) => GestureDetector(
                        onTap: (() {
                          controller.googleSignInMethod();
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Sign_google".trans,
                              color: black,
                              size: 14,
                              alignment: Alignment.center,
                            ),
                            Image.asset(
                              "assets/image/google.png",
                              height: 30,
                              width: 50,
                              color: defultblue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Appheight / 35,
                    ),
                    Button(
                        height: Appheight / 18,
                        width: Appheight / 1.3,
                        onpress: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              builder: (context) {
                                return loginSucssbottom();
                                //faildBottomSheet();
                              });
                        }, //_submit,
                        borderRadius: 20,
                        text: "Create_account".trans,
                        size: 16,
                        textColor: white,
                        buttonColor: defultblue),
                    SizedBox(
                      height: Appheight / 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }
}
