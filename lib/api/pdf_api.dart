import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';
import 'dart:html' as html;

class PdfApi {
  static Future generateCenteredText(String text) async {
    final pdf = Document();
    final customFont = Font.ttf(await rootBundle.load('OpenSans-Regular.ttf'));
    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize: 48, font: customFont)),
      ),
    ));

    Uint8List bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);
    // PdfControllerPinch(document: PdfDocument.openAsset(url));
  }
}
