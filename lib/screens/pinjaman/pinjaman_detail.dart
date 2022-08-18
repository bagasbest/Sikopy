import 'package:flutter/material.dart';

import '../../widget/themes.dart';

class PinjamanDetailScreen extends StatefulWidget {
  final String nama;
  final String besarPinjaman;
  final String angsuranPokok;
  final String angsuranPerbulan;
  final String bunga;
  final String lamaAngsuran;
  final String angsuranBerjalan;
  final String sisaAngsuran;
  final String sisaPinjaman;
  final String tanggalPinjam;
  final String status;

  PinjamanDetailScreen({
    required this.nama,
    required this.besarPinjaman,
    required this.angsuranPokok,
    required this.angsuranPerbulan,
    required this.bunga,
    required this.lamaAngsuran,
    required this.angsuranBerjalan,
    required this.sisaAngsuran,
    required this.sisaPinjaman,
    required this.tanggalPinjam,
    required this.status,
});

  @override
  State<PinjamanDetailScreen> createState() => _PinjamanDetailScreenState();
}

class _PinjamanDetailScreenState extends State<PinjamanDetailScreen> {
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
  bool _showPassword = false;
  bool _visible = false;


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
          title: Text('Detail Pinjaman'),
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
                    child: Center(child: Text('Pinjaman Anggota')),
                  ),
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

                  SizedBox(
                    height: 10,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Tanggal Peminjaman'),
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
                      controller: TextEditingController(text: widget.tanggalPinjam),
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
                    child: Text('Status'),
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
                      controller: TextEditingController(text: widget.status),
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
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: Colors.grey[200],
                      thickness: 10,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Center(child: Text('Keputusan Koperasi')),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Angsuran Pokok'),
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
                      controller: TextEditingController(text: widget.angsuranPokok),
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
                    child: Text('Sisa Pinjaman'),
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
                      controller: TextEditingController(text: widget.sisaPinjaman),
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
}