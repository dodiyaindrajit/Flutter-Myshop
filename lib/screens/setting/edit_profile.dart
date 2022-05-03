import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/constants/style.dart';
import 'package:myshop/constants/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isEditProfile = false;
  bool _isEditFieldVisible = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  void _submit() {
    setState(() {
      _isEditProfile = false;
      _isEditFieldVisible = false;
    });
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: _isEditProfile ? 48.h : 22.h,
        width: 100.w,
        // padding: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: ColorConstants.kDarkGreen,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          ),
        ),
        onEnd: () {
          setState(() {
            if (_isEditProfile) {
              _isEditFieldVisible = true;
            }
          });
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: ColorConstants.kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                ),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(14.w),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo=",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton.icon(
                    icon: const Icon(
                      Icons.edit,
                      color: ColorConstants.kPrimaryColor,
                      size: 20,
                    ),
                    label: Text(
                      "KarmaLn Technology",
                      style:
                          StyleConstants.textStyle18.copyWith(color: ColorConstants.kPrimaryColor),
                    ),
                    onPressed: () {
                      setState(() {
                        _isEditProfile = true;
                      });
                    },
                  ),
                  if (_isEditFieldVisible)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                textFiled("Enter First Name", "First Name", TextInputType.text,
                                    emailController),
                                const SizedBox(width: 10),
                                textFiled("Enter Last Name", "Last Name", TextInputType.text,
                                    emailController),
                              ],
                            ),
                            WidgetConst.spacer(2.h),
                            Row(
                              children: [
                                textFiled("Enter Your Email", "Email", TextInputType.emailAddress,
                                    emailController),
                                const SizedBox(width: 10),
                                textFiled("Enter Your Mobile", "Mobile", TextInputType.phone,
                                    emailController),
                              ],
                            ),
                            WidgetConst.spacer(2.h),
                            Row(
                              children: [
                                textFiled("Choose Date of Birth", "DOB", TextInputType.datetime,
                                    emailController),
                                const SizedBox(width: 10),
                                textFiled("Gender", "Last Name", TextInputType.emailAddress,
                                    emailController),
                              ],
                            ),
                            WidgetConst.spacer(2.h),
                            Row(
                              children: [
                                textFiled("Enter First Name", "First Name",
                                    TextInputType.emailAddress, emailController),
                                const SizedBox(width: 10),
                                textFiled("Enter Last Name", "Last Name",
                                    TextInputType.emailAddress, emailController),
                              ],
                            ),
                            WidgetConst.spacer(2.h),
                            MaterialButton(
                              color: ColorConstants.kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textColor: ColorConstants.kDarkGreen,
                              child: Text("save",
                                  style:
                                      TextStyle(color: ColorConstants.kDarkGreen, fontSize: 20.sp)),
                              onPressed: () => _submit(),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Flexible textFiled(String hintText, String labelText, TextInputType keyboardType,
      TextEditingController controller) {
    return Flexible(
      fit: FlexFit.loose,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: ColorConstants.kBlack,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        style: const TextStyle(height: 1.3),
        decoration: InputDecoration(
          filled: true,
          errorMaxLines: 1,
          labelStyle: const TextStyle(color: ColorConstants.kBlack, letterSpacing: 1, fontSize: 15),
          hintText: hintText,
          labelText: labelText,
          fillColor: ColorConstants.kPrimaryColor,
          // isDense: true,
          contentPadding: EdgeInsets.all(4),
          errorStyle:
              const TextStyle(color: ColorConstants.kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        onFieldSubmitted: (value) {},
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return 'Enter a valid email!';
          }
          return null;
        },
      ),
    );
  }
}
