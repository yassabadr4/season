import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/src/app/controller/google_controller.dart';
import 'package:season/src/app/data/dio/exception/dio_error_extention.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';
import 'package:season/src/app/provider/auth_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/bottom_sheet_camera.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/custom_snackbar.dart';
import 'package:season/src/view/widgets/loading.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';
import 'package:season/src/view/auth/pages/sign_up.dart';
import 'package:season/src/view/auth/widget/bottom_sheet_sucss.dart';
import 'package:quiver/strings.dart';

class SigInPage extends StatefulWidget {
  const SigInPage({super.key});
  @override
  State<SigInPage> createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String? _email;
  String? _password;
  bool _obscure = true;
  _submit() async {
    if (!_formKey.currentState!.validate()) {
      if (!_autoValidate) setState(() => _autoValidate = true);
      return;
    }
    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();
    try {
      LoadingScreen.show(context);
      // final fcmToken = await context.read<AppProvider>().getFCMToken();
      if (!mounted) return;
      await context.read<AuthProvider>().login(_email!, _password!);
      if (!mounted) return;

      showModalBottomSheet(
          context: context,
          builder: (context) {
            return CameraBottomSheet(
              cameraOnpress: () {},
              galleryOnpress: () {},
            );
          });
    } catch (e) {
      Navigator.pop(context);
      showCustomSnackBar(readableError(e), context, isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: _formKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: defultblue),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 80,
                        bottom: 10,
                      ),
                      child: CustomText(
                        text: "haven't_login".trans,
                        color: white,
                        size: 14,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(height: 14),
                    CustomText(
                      text: "Ready".trans,
                      color: white,
                      size: 14,
                      alignment: Alignment.center,
                    ),
                    Container(
                      width: 130,
                      height: 40,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: CustomText(
                        text: "Join_Now".trans,
                        size: 18,
                        weight: FontWeight.bold,
                        color: white,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
            const Divider(
              color: yellow,
              height: 4,
              thickness: 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: CustomText(
                        text: "login_doc".trans,
                        size: 18,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          MainTextField(
                            hint: 'Email'.trans,
                            onSubmit: (email) => _email = email,
                            validator: (email) {
                              if (isBlank(email)) {
                                return 'email_validation'.trans;
                              }
                              if (EmailChecker.isNotValid(email!)) {
                                return 'email_invalid'.trans;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: Appheight / 30,
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
                          ),
                          SizedBox(height: Appheight / 25),
                          SizedBox(height: Appheight / 30),
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
                              //_submit
                            },
                            textColor: Colors.white,
                            buttonColor: defultblue,
                            size: 18,
                            text: 'Login'.trans,
                          ),
                          SizedBox(height: Appheight / 30),
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
                            height: Appheight / 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "not_account".trans,
                                color: black,
                                size: 12,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()),
                                  );
                                },
                                child: CustomText(
                                  text: "Register_now".trans,
                                  color: defultblue,
                                  size: 14,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
