import 'package:flutter/material.dart';

import '../../widget/themes.dart';

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
        child: Scaffold());
  }
}
