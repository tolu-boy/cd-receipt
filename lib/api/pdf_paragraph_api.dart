import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:html' as html;
import '../controllers/messageController.dart';

class PdfParagraphApi {
  static Future generate() async {
    // final MessageController messageController = Get.find<MessageController>();
    // print('kkkk${messageController.allNumbers[0].phone}');

    final pdf = Document();
    final customFont = Font.ttf(await rootBundle.load('OpenSans-Regular.ttf'));
    final customFont2 =
        Font.ttf(await rootBundle.load('OpenSans-SemiBold.ttf'));

    final ByteData image = await rootBundle.load('/logo.png');
    Uint8List imageData = (image).buffer.asUint8List();
    // final ByteData cdImage = await rootBundle.load('/1.png');
    // Uint8List cdImageData = (cdImage).buffer.asUint8List();

    final ByteData cdImageTransparent =
        await rootBundle.load('/transparent.png');
    Uint8List cdImageDataTransparent =
        (cdImageTransparent).buffer.asUint8List();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          // buildCustomHeader(),
          Container(
            padding: const EdgeInsets.only(bottom: 3.9 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: PdfColors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image(MemoryImage(imageData), width: 40, height: 40),
                  SizedBox(width: 0.08 * PdfPageFormat.cm),
                  Text(
                    'CDcare',
                    style: TextStyle(
                        fontSize: 20,
                        color: const PdfColor.fromInt(0xFFF061754),
                        font: customFont),
                  ),
                ]),
                // SizedBox(width: 2 * PdfPageFormat.cm),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25 * PdfPageFormat.mm,
                        vertical: 0.7 * PdfPageFormat.mm),
                    decoration: BoxDecoration(
                      color: const PdfColor.fromInt(0xFFFc6c6c6),
                      border: Border.all(
                          width: 2, color: const PdfColor.fromInt(0xFFFc6c6c6)),
                    ),
                    child: (Text(
                      'Receipt',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                          font: customFont2),
                    ))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                bottom: 0.9 * PdfPageFormat.mm, top: 0.9 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: PdfColors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'BUY ID: gbZhIMeLK5MTpw6fjJEM',
                  style: TextStyle(
                      fontSize: 12, color: PdfColors.black, font: customFont),
                ),
                // SizedBox(width: 2 * PdfPageFormat.cm),
              ],
            ),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Container(
            // Image(MemoryImage(imageData), width: 40, height: 40),
            // padding: const EdgeInsets.all(10 * PdfPageFormat.mm),
            decoration: BoxDecoration(
              color: const PdfColor.fromInt(0xFFFc6c6c6),
              image: DecorationImage(
                  image: MemoryImage(
                    cdImageDataTransparent,
                  ),
                  fit: BoxFit.contain),
              border: Border.all(
                width: 2,
                color: const PdfColor.fromInt(0xFFFc6c6c6),
              ),
            ),
            child: (Container(
              padding: const EdgeInsets.all(10 * PdfPageFormat.mm),
              child: Column(children: [
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('NAME:',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'TOPE OLADIMEJI',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('ADDRESS:',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    '15 Ajegunle Street, Osogbo, Nigeria',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('EMAIL:',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'topeola@gmail.com',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('PHONE NUMBER: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    '08139488385',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('DATE SHIPPED: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'Thu Mar 23 2023',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('ITEM: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'Lontor 16" Rechargable Electric Standing Fan',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('ITEM ID: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    '',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('PRODUCT PRICE:  ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'NGN35,300.00',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('PLAN: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'Weekly',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
                SizedBox(height: 0.4 * PdfPageFormat.cm),
                Row(children: [
                  Container(
                    width: 120,
                    child: Text('TOTAL PAID: ',
                        style: TextStyle(
                            font: customFont2,
                            color: PdfColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 2 * PdfPageFormat.cm),
                  Text(
                    'NGN35,300.00',
                    style: TextStyle(
                      font: customFont,
                      fontSize: 10,
                    ),
                  )
                ]),
              ]),
            )),
          ),
          SizedBox(height: 0.3 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '©CDcare 2021',
                  style: TextStyle(
                    font: customFont,
                    fontSize: 8,
                  ),
                )
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'To Buy & Pay Small Small.',
                  style: TextStyle(
                    font: customFont,
                    fontSize: 8,
                  ),
                )
              ])
        ],
      ),
    );
    Uint8List bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);

    // final bytes = await pdf.save();
    // final blob = html.Blob([bytes], 'application/pdf');
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // final anchor = html.AnchorElement()
    //   ..href = url
    //   ..style.display = 'none'
    //   ..download = 'Receipt.pdf';
    // html.document.body?.children.add(anchor);
    // anchor.click();
    // html.document.body?.children.remove(anchor);
    // html.Url.revokeObjectUrl(url);
  }
}
