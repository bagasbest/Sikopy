import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../widget/common.dart';
import '../widget/themes.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  final _birthLocationController = TextEditingController();
  final _positionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String religion = "Islam";
  String dob = "";
  String gender = "";
  int _groupValue = -1;

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
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
                Icons.app_registration,
                size: 100,
                color: Common.green,
              ),
              const Text(
                'SIKOPY',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Formulir Pendaftaran Anggota',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    /// NIK
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _nikController,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'NIK',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'NIK tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    /// KOLOM NAMA
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Nama Lengkap',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Lengkap tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    /// GENDER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 16,
                            bottom: 5,
                          ),
                          child: Text(
                            "Jenis Kelamin:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _myRadioButton(
                          title: "Laki - Laki",
                          value: 0,
                          onChanged: (newValue) => setState(() {
                            _groupValue = newValue!;
                            gender = 'Laki - Laki';
                          }),
                        ),
                        _myRadioButton(
                          title: "Perempuan",
                          value: 1,
                          onChanged: (newValue) => setState(() {
                            _groupValue = newValue!;
                            gender = 'Perempuan';
                          }),
                        ),
                      ],
                    ),

                    /// TEMPAT LAHIR
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _birthLocationController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Tempat Lahir',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tempat Lahir tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    /// TANGGAL LAHIR
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2023),
                        ).then((date) {
                          //tambahkan setState dan panggil variabel _dateTime.
                          var time = date!.millisecondsSinceEpoch;
                          var dt = DateTime.fromMillisecondsSinceEpoch(time);
                          var d24 = DateFormat('dd MMMM yyyy').format(dt);
                          setState(() {
                            dob = d24;
                          });
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Common.green,
                        ),
                        child: Center(
                            child: Text(
                          (dob == "") ? "Tanggal Lahir" : dob,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    ),

                    /// AGAMA
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 16,
                        ),
                        child: Text(
                          "Agama",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: religion,
                        elevation: 16,
                        style: TextStyle(color: Common.green),
                        underline: Container(
                          height: 2,
                          color: Common.green,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            religion = newValue!;
                          });
                        },
                        items: [
                          'Islam',
                          'Katolik',
                          'Protestan',
                          'Hindu',
                          'Buddha',
                          'Khonghucu'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    // JABATAN
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _positionController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Jabatan',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jabatan tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    /// NOMOR HANDPHONE
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Nomor Handphone',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nomor Handphone tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Email & Kata sandi',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    /// KOLOM EMAIL
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else if (!value.contains('@') ||
                              !value.contains('.')) {
                            return 'Format Email tidak sesuai';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),

                    /// KOLOM PASSWORD
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 1),
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
                          } else if (value.length < 6) {
                            return 'Kata sandi minimal 6 karakter';
                          } else {
                            return null;
                          }
                        },
                      ),
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

                    /// TOMBOL REGISTRASI
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton(
                          color: Common.green,
                          child: const Text(
                            'Mendaftar',
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

                              bool shouldNavigate = await _registerHandler();

                              if (shouldNavigate) {
                                await _registeringUserToDatabase();

                                setState(() {
                                  _visible = false;
                                  _nikController.text = "";
                                  _nameController.text = "";
                                  gender = "";
                                  _birthLocationController.text = "";
                                  _positionController.text = "";
                                  dob = "";
                                  _phoneController.text = "";
                                  _emailController.text = "";
                                  _passwordController.text = "";
                                });

                                _showSuccessRegistration();
                              } else {
                                setState(() {
                                  _visible = false;
                                });
                                _showFailureRegistration();
                              }
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const LoginScreen());
                        Navigator.pushReplacement(context, route);
                      },
                      splashColor: Colors.grey[200],
                      child: Text(
                        'Ke Halaman Login',
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

  _registerHandler() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      return true;
    } catch (error) {
      toast(
          'Gagal melakukan pendaftaran, silahkan periksa kembali data diri anda dan koneksi internet anda');
      return false;
    }
  }

  _registeringUserToDatabase() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('Pendaftaran').doc(uid).set({
        "NIK": _nikController.text,
        "agama": religion,
        "id_pendaftaran": uid,
        "jabatan": _positionController.text,
        "jenis_kelamin": gender,
        "nama_anggota": _nameController.text,
        "email": _emailController.text,
        "no_tlp": _phoneController.text,
        "password": _passwordController.text,
        "status": "pendaftaran",
        "tempat_lahir": _birthLocationController.text,
        "tgl_lahir": dob,
        "role": 'user',
      });
    } catch (error) {
      toast("Gagal melakukan pendaftaran, silahkan cek koneksi internet anda");
    }
  }

  _showSuccessRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Common.green,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Sukses Mendaftar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Divider(
                  color: Colors.white,
                  height: 3,
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Anda berhasil terdaftar pada Sistem Sikopy\n\nSilahkan Login dengan akun anda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Tutup",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Common.green,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
        );
      },
    );
  }

  _showFailureRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gagal Registrasi"),
          content: const Text(
            'Anda gagal terdaftar dalam Sistem Sikopy, silahkan periksa data yang anda inputkan dan periksa koneksi internet, coba lagi kemudian',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _myRadioButton(
      {required String title, required int value, Function(int?)? onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
