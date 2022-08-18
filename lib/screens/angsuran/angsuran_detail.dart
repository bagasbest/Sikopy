
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../database/database_service.dart';
import '../../widget/common.dart';
import '../../widget/themes.dart';
import '../login_screen.dart';

class AngsuranDetailScreen extends StatefulWidget {
 final String nama;
 final String besarPinjaman;
 final String angsuranPokok;
 final String angsuranPerbulan;
 final String lamaAngsuran;
 final String angsuranBerjalan;
 final String sisaAngsuran;
 final String tanggalAngsur;
 final String bunga;

 AngsuranDetailScreen({
   required this.nama,
   required this.besarPinjaman,
   required this.angsuranPokok,
   required this.angsuranPerbulan,
   required this.lamaAngsuran,
   required this.angsuranBerjalan,
   required this.sisaAngsuran,
   required this.tanggalAngsur,
   required this.bunga,
});

  @override
  State<AngsuranDetailScreen> createState() => _AngsuranDetailScreenState();
}

class _AngsuranDetailScreenState extends State<AngsuranDetailScreen> {
  final _nameController = TextEditingController();
  final _besarPinjamanController = TextEditingController();
  final _angsuranPokokController = TextEditingController();
  final _idPinjamanController = TextEditingController();
  final _jumlahPinjamanController = TextEditingController();
  final _angsuranController = TextEditingController();
  final _lamaAngsuranController = TextEditingController();
  String tanggalPinjaman = "";
  final _noRekeningController = TextEditingController();
  final _noTeleponController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isImageAdd = false;
  XFile? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Angsuran'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Nama Lengkap'),
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
                      controller: TextEditingController(text: widget.nama),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: 'Nama Anggota',
                        border: InputBorder.none,
                        enabled: false
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Anggota tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Besar Pinjaman'),
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
                      controller: TextEditingController(text: widget.besarPinjaman),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: 'Besar Pinjaman',
                        border: InputBorder.none,
                        enabled: false
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


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Angsuran Pokok'),
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
                      controller: TextEditingController(text: widget.angsuranPokok),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: 'Angsuran Pokok',
                        border: InputBorder.none,
                        enabled: false
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

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Angsuran Perbulan'),
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
                      controller: TextEditingController(text: widget.angsuranPerbulan),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Angsuran Perbulan',
                        border: InputBorder.none,
                        enabled: false
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


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Lama Angsuran'),
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
                      controller: TextEditingController(text: widget.lamaAngsuran),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Keterangan Pengajuan Pinjaman',
                        border: InputBorder.none,
                        enabled: false
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

                  SizedBox(
                    height: 10,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Angsuran Berjalan'),
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
                      controller: TextEditingController(text: widget.angsuranBerjalan),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Angsuran Perbulan',
                          border: InputBorder.none,
                          enabled: false
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


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Sisa Angsuran'),
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
                      controller: TextEditingController(text: widget.sisaAngsuran),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Angsuran Perbulan',
                          border: InputBorder.none,
                          enabled: false
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


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Tanggal Angsur'),
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
                      controller: TextEditingController(text: widget.tanggalAngsur),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Angsuran Perbulan',
                          border: InputBorder.none,
                          enabled: false
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


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Bunga'),
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
                      controller: TextEditingController(text: widget.bunga),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Angsuran Perbulan',
                          border: InputBorder.none,
                          enabled: false
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


                  const SizedBox(
                    height: 30,
                  ),

                  (!isImageAdd)
                      ? GestureDetector(
                    onTap: () async {
                      _image =
                      await DatabaseService.getImageGallery();
                      if (_image == null) {
                        setState(() {
                          toast("Gagal ambil foto");
                        });
                      } else {
                        setState(() {
                          isImageAdd = true;
                          _showSuccessUploadTransfer();
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 1,
                        dashPattern: [6, 6],
                        child: Container(
                          height: 200,
                          child: Center(
                            child: Text("* Upload Transfer Angsuran"),
                          ),
                        ),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(
                          _image!.path,
                        ),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  ),

                  SizedBox(
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

  _showSuccessUploadTransfer() {
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
                  'Sukses Unggah Transfer',
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
                'Anda berhasil mengunggah bukti transfer angsuran\n\nadmin akan memverifikasi bukti transfer anda.',
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
                      "KEMBALI",
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