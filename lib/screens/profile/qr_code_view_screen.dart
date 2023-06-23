import 'package:flutter/material.dart';
import 'package:hacki/styles/palette.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeViewScreen extends StatelessWidget {
  const QrCodeViewScreen({
    required this.data,
    super.key,
  });

  final String data;

  static const String routeName = '/qr-code-view';

  static Route<dynamic> route({required String data}) {
    return MaterialPageRoute<QrCodeViewScreen>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => QrCodeViewScreen(
        data: data,
      ),
    );
  }

  static const int qrCodeVersion = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QrImageView(
            data: data,
            dataModuleStyle: QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            eyeStyle: QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            version: qrCodeVersion,
          ),
        ],
      ),
    );
  }
}
