import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sikopy/screens/register_screen.dart';

import '../widget/common.dart';
import '../widget/themes.dart';
import 'homepage_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Common.green,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Icon(
                Icons.login,
                size: 100,
                color: Common.green,
              ),
              const Text(
                'LOGIN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Masukkan Email & Kata Sandi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// KOLOM EMAIL
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email_outlined),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    /// KOLOM PASSWORD
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Kata Sandi',
                          prefixIcon: Icon(Icons.lock_open),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(_showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kata Sandi tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),


                    /// LOADING INDIKATOR
                    Visibility(
                      visible: _visible,
                      child: SpinKitRipple(
                        color: Common.green,
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    /// TOMBOL LOGIN
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 16,),
                      child: RaisedButton(
                          color: Common.green,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () async {
                            /// CEK APAKAH EMAIL DAN PASSWORD SUDAH TERISI DENGAN FORMAT YANG BENAR
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _visible = true;
                              });

                              bool shouldNavigate = await _signInHandler(
                                _emailController.text,
                                _passwordController.text,
                              );

                              if (shouldNavigate) {
                                setState(() {
                                  _visible = false;
                                });

                                _formKey.currentState!.reset();

                                /// MASUK KE HOMEPAGE JIKA SUKSES LOGIN
                                Route route = MaterialPageRoute(
                                    builder: (context) =>
                                        const HomepageScreen());
                                Navigator.pushReplacement(context, route);
                              } else {
                                setState(() {
                                  _visible = false;
                                });
                              }
                            } else {
                              toast(
                                  'Maaf, Email atau Kata sandi anda tidak terdaftar');
                              setState(() {
                                _visible = false;
                              });
                            }
                            //}
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const RegisterScreen());
                        Navigator.push(context, route);
                      },
                      splashColor: Colors.grey[200],
                      child: Text(
                        'Saya Ingin Mendaftar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Common.green,
                        ),
                      ),
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

  _signInHandler(String email, String password) async {
    try {
      (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      return true;
    } catch (error) {
      toast(
          'Terdapat kendala ketika ingin login. Silahkan periksa kembali email & password, serta koneksi internet anda');
      return false;
    }
  }
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Common.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
