import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import '../commons/formatter.dart';

class PdfInvoice {
  static Future<pw.Widget> buildHeader(
      {required String name,
      required String address,
      required String id,
      required String date,
      required bool receiptType,
      required num totalPaid,
      required num price,
      String? valid}) async {
    final boldFont = pw.Font.ttf(await rootBundle.load('playfair.ttf'));
    final boldFont2 =
        pw.Font.ttf(await rootBundle.load('PlayfairDisplay-Bold.ttf'));
    final regularFont = pw.Font.ttf(await rootBundle.load('montserrat.ttf'));
    final lightFont =
        pw.Font.ttf(await rootBundle.load('Montserrat-Light.ttf'));
    final ByteData image = await rootBundle.load('/cd12.png');
    Uint8List imageData = (image).buffer.asUint8List();
    return pw.Column(
      children: [
        pw.Row(
          // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            // pw.SizedBox(width: 180, child: image),
            pw.Row(
              children: [
                pw.Image(pw.MemoryImage(imageData), width: 125, height: 125),
              ],
            ),
            pw.SizedBox(width: 185),

            receiptType == false
                ? pw.Column(
                    children: [
                      pw.Text("TEMPORARY\nRECEIPT",
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex("#2764ed"),
                            fontSize: 30,
                            font: boldFont2,
                          )),
                    ],
                  )
                : pw.Text(
                    "RECEIPT",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex("#2764ed"),
                      fontSize: 35,
                      font: boldFont,
                    ),
                  )
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.SizedBox(width: 10),
            pw.SizedBox(
              width: 220,
              child: pw.Text(
                'Issued to:\n$name\n'
                '$address',
                style: pw.TextStyle(
                  // fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                  height: 10,
                  fontSize: 12,
                  font: lightFont,
                ),
              ),
            ),
            // pw.Spacer(),
            pw.SizedBox(width: 80),
            pw.SizedBox(
              width: 250,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  receiptType == false
                      ? pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "VALID TILL: $valid.",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                fontSize: 12,
                                font: regularFont,
                              ),
                            )
                          ],
                        )
                      : pw.Container(),
                  !receiptType == false
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "BUY ID: $id.",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          fontSize: 12,
                          font: regularFont,
                        ),
                      ),
                    ],
                  ),
                  !receiptType == false
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox(height: 5),
                  receiptType == false
                      ? pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Balance Due: NGN${currencyFormatter.format(price - totalPaid)}.",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                fontSize: 12,
                                font: regularFont,
                              ),
                            )
                          ],
                        )
                      : pw.Container(),
                  !receiptType == false
                      ? pw.SizedBox(height: 10)
                      : pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Date Shipped: $date",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          fontSize: 12,
                          font: regularFont,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 40),
        pw.Container(
          color: PdfColor.fromHex("#5A97FF"),
          child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: pw.Row(
              children: [
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    "S/N",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                      fontSize: 12,
                      font: regularFont,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 4,
                  child: pw.Text(
                    "ITEM",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      // color: PdfColor.fromHex("#F5574C"),
                      fontSize: 12,
                      font: regularFont,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    "QTY",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      // color: PdfColor.fromHex("#F5574C"),
                      fontSize: 12,
                      font: regularFont,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    "PRICE",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      // color: PdfColor.fromHex("#F5574C"),
                      fontSize: 12,
                      font: regularFont,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 2,
                  child: pw.Text(
                    "PLAN",
                    textAlign: pw.TextAlign.left,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      // color: PdfColor.fromHex("#F5574C"),
                      fontSize: 12,
                      font: regularFont,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Future<pw.Widget> buildBody(
      {required String item, required String plan, required num price}) async {
    final regularFont =
        pw.Font.ttf(await rootBundle.load('Montserrat-Light.ttf'));

    return pw.Container(
      child: pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: pw.Row(
          children: [
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '1',
                // serialNumber.toString(),
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  // color: PdfColor.fromHex("#F5574C"),
                  fontSize: 12,
                  font: regularFont,
                ),
              ),
            ),
            pw.Expanded(
              flex: 4,
              child: pw.Text(
                item,
                // invoiceItemModel.description,
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  // color: PdfColor.fromHex("#F5574C"),
                  fontSize: 12,
                  font: regularFont,
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                '1',
                // invoiceItemModel.qty.toString(),
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  // color: PdfColor.fromHex("#F5574C"),
                  fontSize: 12,
                  font: regularFont,
                ),
              ),
            ),
            pw.Expanded(
              flex: 3,
              child: pw.Text(
                'NGN${currencyFormatter.format(price)}',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  // color: PdfColor.fromHex("#F5574C"),
                  fontSize: 12,
                  font: regularFont,
                ),
              ),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Text(
                plan,
                // currencyFormatterWithoutSymbolAndSpace
                //     .format(invoiceItemModel.subtotal),
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  // color: PdfColor.fromHex("#F5574C"),
                  fontSize: 12,
                  font: regularFont,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<pw.Widget> buildTotal(
      {required num price, required num totalPaid}) async {
    final fontBold = pw.Font.ttf(await rootBundle.load('montserrat.ttf'));
    return pw.Column(
      children: [
        pw.SizedBox(height: 20),
        pw.Divider(height: 2, color: PdfColors.grey300),
        pw.Divider(height: 2, color: PdfColors.grey300),
        pw.SizedBox(height: 5),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.SizedBox(width: 10),
            pw.Spacer(),
            pw.SizedBox(
                width: 320,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            "ITEM PRICE:",
                            style: pw.TextStyle(
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            'NGN${currencyFormatter.format(price)}',
                            // currencyFormatterWithoutSymbol.format(subtotal),
                            style: pw.TextStyle(
                              // fontWeight: pw.FontWeight.bold,
                              // color: PdfColor.fromHex("#F5574C"),
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        )
                      ],
                    ),
                    pw.Divider(height: 8, color: PdfColors.grey300),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            "TOTAL PAID:",
                            style: pw.TextStyle(
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            'NGN${currencyFormatter.format(totalPaid)}',
                            style: pw.TextStyle(
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        )
                      ],
                    ),
                    pw.Divider(
                        height: 12, thickness: 3, color: PdfColors.grey300),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            "BALANCE DUE :",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              // color: PdfColor.fromHex("#F5574C"),
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            'NGN${currencyFormatter.format(price - totalPaid)}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              // color: PdfColor.fromHex("#F5574C"),
                              fontSize: 14,
                              font: fontBold,
                            ),
                          ),
                        )
                      ],
                    ),
                    pw.Divider(
                        height: 8, thickness: 3, color: PdfColors.grey300),
                  ],
                )),
          ],
        ),
        pw.SizedBox(height: 20),
      ],
    );
  }

  static Future<pw.Widget> buildFooter({required bool receiptType}) async {
    final lightFont =
        pw.Font.ttf(await rootBundle.load('Montserrat-Light.ttf'));

    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.SizedBox(height: 10),
          receiptType == false
              ? pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 20),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          textAlign: pw.TextAlign.center,
                          'All item(s) purchased on instalment remains the property of CDcare until all\n'
                          'instalments are paid including any interests accrued due to late payments\n'
                          'notwithstanding that the buyer has taken delivery of the purchased item(s)\n'
                          'before paying the last instalment',
                          style: pw.TextStyle(
                            font: lightFont,
                            fontSize: 12,
                          ),
                        )
                      ]))
              : pw.Container(),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  '©CDcare 2021',
                  style: pw.TextStyle(
                    font: lightFont,
                    fontSize: 8,
                  ),
                )
              ]),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'To Buy & Pay Small Small.',
                  style: pw.TextStyle(
                    font: lightFont,
                    fontSize: 8,
                  ),
                )
              ])
        ]);
  }

  static Future makeReceipt(
      {required String name,
      required String address,
      required String id,
      required String date,
      required bool receiptType,
      required num price,
      required String item,
      String? valid,
      required num totalPaid,
      required String balance,
      required String plan}) async {
    final pdf = pw.Document();
    pw.Widget header = await buildHeader(
        name: name,
        address: address,
        id: id,
        date: date,
        receiptType: receiptType,
        price: price,
        totalPaid: totalPaid,
        valid: valid);
    pw.Widget body = await buildBody(item: item, plan: plan, price: price);
    pw.Widget total = await buildTotal(price: price, totalPaid: totalPaid);
    pw.Widget footer = await buildFooter(receiptType: receiptType);

    pdf.addPage(
      pw.MultiPage(
        build: (context) => <pw.Widget>[header, body, total, footer],
      ),
    );

    // Uint8List bytes = await pdf.save();
    // final blob = html.Blob([bytes], 'application/pdf');
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // html.window.open(url, "_blank");
    // html.Url.revokeObjectUrl(url);

    final bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement()
      ..href = url
      ..style.display = 'none'
      ..download = 'Receipt.pdf';
    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}
