import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/utils/color.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(
                  height: 32,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1626818590138-c1e906bf29be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmwlMjBhbG9uZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter your username",
                  textInputType: TextInputType.text,
                  textEditingController: _usernameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter your password",
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: _pwdController,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: "Enter your bio",
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () async {
                    String res = await AuthMethods().signUpUser(
                        email: _emailController.text.trim(),
                        pwd: _pwdController.text.trim(),
                        username: _usernameController.text.trim(),
                        bio: _bioController.text.trim());

                    print(res);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        color: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: const Text('Sign Up'),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Already have account?'),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('sign up clicked');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            ' Sign in',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
