import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

import '../../components/barcode.dart';
import '../../components/buttons.dart';

class HomePage extends StatefulWidget {
  final String title = "Bargen";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final _barcodeStringController = TextEditingController();
  BarCodeType _selectedBarcodeType = BarCodeType.Code39;
  BarCodeType _barcodeType;
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
            _barcode(),
            _inputArea(),
            _createButton(),
          ],
        ),
      ),
    );
  }

  Barcode _barcode() {
    return Barcode(
      barcodeString: _barcodeString,
      codeType: _barcodeType,
    );
  }

  Widget _inputArea() {
    return Column(
      children: <Widget>[
        // BarcodeType DropdownnButton Widget
        Container(
          margin: EdgeInsets.only(top: 16.0),
          width: 180.0,
          alignment: Alignment.center,
          child: DropdownButton<BarCodeType>(
            value: _selectedBarcodeType,
            items: BarCodeType.values.map((BarCodeType type) {
              return DropdownMenuItem<BarCodeType>(
                value: type,
                child: Text(_toStringBarCodeType(type)),
              );
            }).toList(),
            isExpanded: true,
            onChanged: (type) {
              setState(() {
                _selectedBarcodeType = type;
              });
            },
          ),
        ),
        // Input the barcode string Widget
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
      ],
    );
  }

  Widget _createButton() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: BorderEllipseButton(
        text: "Create",
        onPressed: () {
          setState(() {
            _barcodeString = _barcodeStringController.text;
            _barcodeType = _selectedBarcodeType;
          });
        },
      ),
    );
  }

  String _toStringBarCodeType(BarCodeType type) {
    var len = "BarCodeType.".length;
    return type.toString().substring(len);
  }
}
