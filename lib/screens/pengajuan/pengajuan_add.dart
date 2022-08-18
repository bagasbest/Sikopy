import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sikopy/screens/login_screen.dart';

import '../../widget/common.dart';
import '../../widget/themes.dart';

class PengajuanAddScreen extends StatefulWidget {
  const PengajuanAddScreen({Key? key}) : super(key: key);

  @override
  State<PengajuanAddScreen> createState() => _PengajuanAddScreenState();
}

class _PengajuanAddScreenState extends State<PengajuanAddScreen> {
  final _nameController = TextEditingController();
  final _ktpController = TextEditingController();
  final _keteranganController = TextEditingController();
  final _idPinjamanController = TextEditingController();
  final _jumlahPinjamanController = TextEditingController();
  final _angsuranController = TextEditingController();
  final _lamaAngsuranController = TextEditingController();
  String tanggalPinjaman = "";
  final _noRekeningController = TextEditingController();
  final _noTeleponController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Buat Pengajuan Baru'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Data Permohonan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  /// KOLOM NAMA
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
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

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM KTP
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _ktpController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'No KTP',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No KTP tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM ID PINJAMAN
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _idPinjamanController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'ID Pinjaman',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ID Pinjaman tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM JUMLAH PINJAMAN
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _jumlahPinjamanController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Jumlah Pinjaman',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Jumlah Pinjaman tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM ANGSURAN
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _angsuranController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Angsuran',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Angsuran tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM Lama Angsuran
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _lamaAngsuranController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Lama Angsuran',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lama Angsuran tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM Tanggal Pinjaman
                  InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2023),
                      ).then((date) {
                        //tambahkan setState dan panggil variabel _dateTime.
                        var time = date!.millisecondsSinceEpoch;
                        var dt = DateTime.fromMillisecondsSinceEpoch(time);
                        var d24 = DateFormat('dd MMMM yyyy').format(dt);
                        setState(() {
                          tanggalPinjaman = d24;
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
                          (tanggalPinjaman == "")
                              ? "Pilih Tanggal Pinjaman"
                              : tanggalPinjaman,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM NO REKENING
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _noRekeningController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'No Rekening',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Rekening tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM No Telpon
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _noTeleponController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Nomor Telepon',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor Telepon tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// KOLOM Keterangan
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _keteranganController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Keterangan Pengajuan Pinjaman',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Keterangan Pengajuan Pinjaman tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 30,
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

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                        color: Common.green,
                        child: const Text(
                          'Simpan',
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
                          if (_formKey.currentState!.validate() && tanggalPinjaman != "") {
                            setState(() {
                              _visible = true;
                            });

                            _showSuccessPengajuanPinjaman();

                            setState(() {
                              _nameController.text = "";
                              _ktpController.text = "";
                              _keteranganController.text = "";
                              _idPinjamanController.text = "";
                              _jumlahPinjamanController.text = "";
                              _angsuranController.text = "";
                              _lamaAngsuranController.text = "";
                              _noRekeningController.text = "";
                              _noTeleponController.text = "";
                              tanggalPinjaman = "";
                              _visible = false;
                            });
                          } else if (tanggalPinjaman == "") {
                            toast('Silahkan memilih tanggal pinjaman terlebih dahulu!');
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  _showSuccessPengajuanPinjaman() {
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
                  'Sukses Mengajukan Pinjaman',
                  textAlign: TextAlign.center,
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
                'Anda berhasil melakukan pengajuan pinjaman pada aplikasi Sikopy\n\nSilahkan tunggu beberapa saat hingga admin memverifikasi permohonan anda.',
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
                      "OKE",
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

}
