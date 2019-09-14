import 'package:flutter/material.dart';

import 'barcode_page.dart';
import 'qrcode_page.dart';

class HomePage extends StatefulWidget {
  final String title = "Bargen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(text: "QR Code"),
              Tab(text: "Barcode"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QRCodePage(),
            BarcodePage(),
          ],
        ),
      ),
    );
  }
}
