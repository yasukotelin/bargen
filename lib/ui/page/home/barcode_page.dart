import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

import '../../components/barcode.dart';
import '../../components/buttons.dart';

class BarcodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  final _barcodeStringController = TextEditingController();
  BarCodeType _selectedBarcodeType = BarCodeType.Code39;
  BarCodeType _barcodeType;
  String _barcodeString = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _barcode(),
            _inputArea(),
            _createButton(),
          ],
        ),
      ),
    );
  }

  Widget _barcode() {
    return Container(
      alignment: Alignment.center,
      height: 150,
      child: _barcodeString.isEmpty
          ? Icon(Icons.blur_on, size: 100)
          : Barcode(
              barcodeString: _barcodeString,
              codeType: _barcodeType,
            ),
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
      margin: EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        child: Text("Create"),
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
