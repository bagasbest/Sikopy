import 'package:flutter/material.dart';

import '../../widget/themes.dart';
import 'angsuran_detail.dart';

class AngsuranScreen extends StatefulWidget {
  const AngsuranScreen({Key? key}) : super(key: key);

  @override
  State<AngsuranScreen> createState() => _AngsuranScreenState();
}

class _AngsuranScreenState extends State<AngsuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Angsuran Pengembalian'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child:  Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => AngsuranDetailScreen(
                            nama: "Andi Santoso",
                            besarPinjaman: 'Rp.10.000.000',
                            angsuranPokok: 'Rp.1.000.000',
                            angsuranPerbulan: 'Rp.1.200.000',
                            lamaAngsuran: '10 Bulan',
                            angsuranBerjalan: '6 Bulan',
                            sisaAngsuran: '4 Bulan',
                            tanggalAngsur: 'Setiap Tanggal 10',
                            bunga: "Rp.200.000",
                          ));
                      Navigator.push(context, route);
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                                color: Colors.green[200],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '18 Juli 2022',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    'Status: Masih Berjalan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 16,),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Andi Santoso',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Besar Pinjaman: Rp.10.000.000'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Lama Angsuran: 10 Bulan'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Angsuran Berjalan: 6 Bulan'),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),),

                            Center(
                              child: Text(
                                'Detail Angsuran',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),


                            SizedBox(height: 16,),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
