import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/views/register_page.dart';
import 'package:untitled/views/widgets/Custom_buttom.dart';
import 'package:untitled/views/widgets/custom_text_form_field.dart';

import '../constant.dart';
import '../helper/show_snak_bar.dart';
import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? emailAddress;
  bool isLoading = false;
  String? password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      'assets/images/phone-message.png',
                    ),
                  ),
                  const Text(
                    "Scalar Chat",
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "login",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      onChanged: (data) {
                        emailAddress = data;
                      },
                      hintText: "Email",
                      iconWidget: const Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    obscure: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: "Password",
                      iconWidget: const Icon(
                        Icons.panorama_photosphere_select_sharp,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    textButton: "Sign In",
                    method: () async {
                      if (_formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatPage(email: emailAddress.toString()),));

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnakBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnakBar(context,
                                'Wrong password provided for that user.');

                          }
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don not have an account ?  ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Color(0xFFC7EDE6),
                              fontSize: 25,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> loginUser() async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress!, password: password!);
  }
}
