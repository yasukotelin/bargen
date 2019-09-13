import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class Home extends StatefulWidget {
  final String title = "Bargen";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _barcodeStringController = TextEditingController();
  String _barcodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Barcode(
              barcodeString: _barcodeString,
              codeType: BarCodeType.Code39,
            ),
            _inputArea(),
          ],
        ),
      ),
    );
  }

  Widget _inputArea() {
    return Column(
      children: <Widget>[
        Container(
          width: 280.0,
          alignment: Alignment.center,
          child: TextField(
            controller: _barcodeStringController,
            decoration: const InputDecoration(
              labelText: "Input the barcode string",
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          child: RaisedButton(
            child: Text("Create"),
            color: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.green),
            ),
            onPressed: () {
              setState(() {
                _barcodeString = _barcodeStringController.text;
              });
            },
          ),
        ),
      ],
    );
  }
}

class Barcode extends StatefulWidget {
  Barcode({this.barcodeString, this.codeType});

  final String barcodeString;
  final BarCodeType codeType;

  @override
  State<StatefulWidget> createState() => BarcodeState();
}

class BarcodeState extends State<Barcode> {
  @override
  Widget build(BuildContext context) {
    return _generate();
  }

  Widget _generate() {
    if (widget.barcodeString == null || widget.barcodeString.isEmpty) {
      return Container();
    } else {
      return _createBarcode();
    }
  }

  Widget _createErrorWidget(String errorMsg) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.mood_bad,
          size: 50,
        ),
        Text(errorMsg),
      ],
    );
  }

  BarCodeImage _createBarcode() {
    return BarCodeImage(
      data: widget.barcodeString,
      codeType: widget.codeType,
      lineWidth: 2.0,
      barHeight: 100.0,
      hasText: true,
      onError: (error) {
        print(error);
      },
    );
  }
}
