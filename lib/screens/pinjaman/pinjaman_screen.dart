import 'package:flutter/material.dart';
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

      ),
    );
  }
}
