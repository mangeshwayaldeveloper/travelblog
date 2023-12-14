import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_booking/Screen/signup.dart';

import '../provider/user_provider.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _signKey = GlobalKey();
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _signKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Image.asset("assets/traveller.jpg"),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Login To Traveller",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Enter an Email",
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!emailValid.hasMatch(value)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter a password",
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      } else if (value.length < 6) {
                        return "Password Should Be Minimum 6 Character Long";
                      } else if (value.length > 20) {
                        return "Password Should Not Be Greater Than 20";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                        onPressed: () async {
                          if (_signKey.currentState!.validate()) {
                            try {
                              await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                              ref.read(userProvider.notifier).login(_emailController.text);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                    },
                    child: Text("Don't have an account? Sign up here")),
              ],
            ),
          ),
        ));
  }
}
