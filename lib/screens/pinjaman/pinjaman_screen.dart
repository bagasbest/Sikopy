import 'package:flutter/material.dart';
import 'package:sikopy/screens/pinjaman/pinjaman_detail.dart';
import 'package:sikopy/widget/themes.dart';

class PinjamanScreen extends StatefulWidget {
  const PinjamanScreen({Key? key}) : super(key: key);

  @override
  State<PinjamanScreen> createState() => _PinjamanScreenState();
}

class _PinjamanScreenState extends State<PinjamanScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pengajuan Pinjaman'),
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
                        builder: (context) => PinjamanDetailScreen(

                          nama: "Andi Santoso",
                          besarPinjaman: 'Rp.10.000.000',
                          angsuranPokok: 'Rp.1.000.000',
                          angsuranPerbulan: 'Rp.1.200.000',
                          bunga: 'Rp.200.000',
                          lamaAngsuran: '10 Bulan',
                          angsuranBerjalan: "6 Bulan",
                          sisaAngsuran: "4 Bulan",
                          sisaPinjaman: 'Rp.100.000',
                          tanggalPinjam: '18 Maret 2022', status: 'Masih Berjalan',
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
                                Text('Tanggal Pinjam: 18 Agustus 2022'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pinjaman: Rp.10.000.000'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Angsuran Perbulan: Rp.1.000.000'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),),

                          Center(
                            child: Text(
                              'Detail Pinjaman',
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
                InkWell(
                  onTap: () {
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
                                  '15 April 2022',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  'Status: Selesai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
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
                                Text('Tanggal Pinjam: 15 April 2022'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pinjaman: Rp.5.000.000'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Angsuran Perbulan: Rp.500.000'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),),

                          Center(
                            child: Text(
                              'Detail Pinjaman',
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
                InkWell(
                  onTap: () {
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
                                  '10 Januari 2022',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  'Status: Selesai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
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
                                Text('Tanggal Pinjam: 10 Januari 2022'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pinjaman: Rp.25.000.000'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Angsuran Perbulan: Rp.2.500.000'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),),

                          Center(
                            child: Text(
                              'Detail Pinjaman',
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
                InkWell(
                  onTap: () {
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
                                  '10 September 2021',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  'Status: Selesai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
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
                                Text('Tanggal Pinjam: 10 September 2021'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pinjaman: Rp.100.000.000'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Angsuran Perbulan: Rp.10.500.000'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),),

                          Center(
                            child: Text(
                              'Detail Pinjaman',
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
              ],
            ),
          ),
        )
      ),
    );
  }
}
