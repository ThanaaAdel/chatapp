import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/views/chat_page.dart';
import 'package:untitled/views/widgets/Custom_buttom.dart';
import 'package:untitled/views/widgets/custom_text_form_field.dart';

import '../constant.dart';
import '../helper/show_snak_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? emailAddress;
 bool isLoading = false;
  String? password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor:kPrimaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
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
                    children: const [
                      Text(
                        "Register",
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
                      textButton: "Register",
                      method: () async {
                        if(_formKey.currentState!.validate()){
                          isLoading = true;
                          setState(() {

                          });
                          try {
                            await registerUser();
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatPage(email: emailAddress.toString()),));

                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnakBar(context,'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showSnakBar(context,'The account already exists for that email.');
                            }
                          } catch (e) {
                            showSnakBar(context,'there was an error !!!!! ');
                          }
                          isLoading = false;
                          setState(() {

                          });

                        }
                        else{

                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do have an account ?  ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "LogIn  ",
                            style: TextStyle(
                                color: Color(0xFFC7EDE6),
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontSize: 25),
                          )),
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



  Future<void> registerUser() async {
     UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
