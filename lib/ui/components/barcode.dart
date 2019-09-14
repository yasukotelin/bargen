import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

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
      return _createEmptyWidget();
    } else {
      return _createBarcode();
    }
  }

  // Widget _createEmptyWidget() {
  //   return Column(
  //     children: <Widget>[
  //       Icon(Icons.mood, size: 50.0),
  //       Text("Let's generate a Barcode!", style: TextStyle(fontSize: 20.0)),
  //     ],
  //   );
  // }

  Widget _createEmptyWidget() {
    return Container();
  }

  BarCodeImage _createBarcode() {
    return BarCodeImage(
      data: widget.barcodeString,
      codeType: widget.codeType,
      lineWidth: 2.0,
      barHeight: 100.0,
      hasText: true,
      onError: (error) {
        // TODO ライブラリ側のコードを修正してonErrorを同期的に取れるようにする
        // ライブラリ側のonErrorの発行タイミングがBarcodeオブジェクトを生成した後の処理で使っているため、非常に扱いづらい。
        // バリデーションチェック時でしか使われていないため、Barcodeオブジェクト生成時にその処理を行うように修正すればよさそう。
        print("error -> $error");
      },
    );
  }
}
