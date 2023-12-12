import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking/Screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Store additional user information in Firestore
      await storeUserNameInFirestore(userName);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('An unknown error has occurred: $e');
      }
    } catch (e) {
      print('An unknown error has occurred: $e');
    }
    return null;
  }

  Future<void> storeUserNameInFirestore(String userName) async {
    final User user = _auth.currentUser!;
    final uid = user.uid;
    await _firestore.collection('users').doc(uid).set({
      'userName': userName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   "Images/svg/logo.svg",
                  //   height: 50,
                  // ),
                  Image.asset("assets/traveller.jpg"),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter Your Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });

                          // Get values from the form
                          String enteredEmail = email.text.trim();
                          String enteredPassword = password.text.trim();
                          String enteredUsername = username.text.trim();

                          try {
                            // Sign up the user with email and password
                            UserCredential? userCredential =
                                await signUpWithEmailAndPassword(
                              enteredEmail,
                              enteredPassword,
                              enteredUsername,
                            );

                            if (userCredential != null) {
                              // Navigate to the login screen after successful signup
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            }
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      child: _isLoading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Have an Account? Login"),
      ),
    );
  }
}
