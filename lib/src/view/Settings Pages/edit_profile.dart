import 'dart:io';
import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiver/strings.dart';
import 'package:season/src/app/data/dio/exception/dio_error_extention.dart';
import 'package:season/src/app/localization/localizations.dart';
import 'package:season/src/app/localization/ys_localizations_provider.dart';
import 'package:season/src/app/provider/auth_provider.dart';
import 'package:season/src/app/utils/color.dart';
import 'package:season/src/app/utils/data_status.dart';
import 'package:season/src/app/utils/utils_copy.dart';
import 'package:season/src/view/widgets/bottom_sheet_camera.dart';
import 'package:season/src/view/widgets/button.dart';
import 'package:season/src/view/widgets/custom_snackbar.dart';
import 'package:season/src/view/widgets/defult_userImage.dart';
import 'package:season/src/view/widgets/main_textfield.dart';
import 'package:season/src/view/widgets/text.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String? _userName;
  String? _email;
  String? _password;
  bool _obscure = true;
  File? _imageFile;

  _submit() async {
    final auth = context.read<AuthProvider>();
    if (!_formKey.currentState!.validate()) {
      if (!_autoValidate) setState(() => _autoValidate = true);
      return;
    }
    _formKey.currentState!.save();
    try {
      await auth.updateProfile(
        _userName!,
        _email!,
        password: _password,
        image: _imageFile,
      );
    } catch (e) {
      Navigator.pop(context);
      showCustomSnackBar(readableError(e), context, isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final user = context.watch<AuthProvider>().currentUser;
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: _formKey,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Appheight / 12,
              ),
              CustomText(
                text: "Edit_Profile".trans,
                size: 18,
                weight: FontWeight.bold,
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
                            : DefuletImageUser()),
                    GestureDetector(
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
                      child: Icon(
                        Icons.camera_alt,
                        color: defultblue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Appheight / 33,
              ),
              Text("User_Name".trans),
              SizedBox(
                height: Appheight / 50,
              ),
              MainTextField(
                hint: 'User_Name'.trans,
                onSubmit: (firstname) => _userName = firstname,
                init: user?.name ?? '',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: defultblue,
                ),
                validator: Validator(
                  rules: [
                    RequiredRule(
                      validationMessage: 'username_validation'.trans,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Appheight / 50),
              Text("Email".trans),
              SizedBox(
                height: Appheight / 50,
              ),
              MainTextField(
                hint: 'Email'.trans,
                onSubmit: (email) => _email = email,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: defultblue,
                ),
                init: user?.email ?? '',
                keyboardType: TextInputType.emailAddress,
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
                height: Appheight / 50,
              ),
              Text("Password".trans),
              SizedBox(
                height: Appheight / 50,
              ),
              MainTextField(
                obscureText: _obscure,
                hint: 'Password'.trans,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: defultblue,
                ),
                onSubmit: (password) => _password = password,
                suffixIcon: InkWell(
                  onTap: () {
                    _obscure = !_obscure;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.remove_red_eye,
                    color:
                        _obscure ? null : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: Appheight / 33,
              ),
              auth.updateProfileStatus == DataStatus.loading
                  ? const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      ),
                    )
                  : Center(
                      child: Button(
                          height: Appheight / 20,
                          width: Appwidth / 2,
                          onpress: _submit,
                          text: "Save".trans,
                          textColor: Colors.white,
                          buttonColor: defultblue,
                          size: 18),
                    )
            ]),
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
