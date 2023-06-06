import 'dart:convert';

import 'package:get/get.dart';
import '../api/pdf_invoice.dart';
import '../model/InvoiceModel.dart';

class InvoiceController extends GetConnect {
  Rx<InvoiceModel> receiptDetails = InvoiceModel.empty().obs;

  getReceiptDetails(String productID) async {
    try {
      await get(
              'https://us-central1-cdcare-mobile-app.cloudfunctions.net/getReceiptData/$productID')
          .then((response) async {
        Map<String, dynamic> receiptResponse = response.body["data"];
        receiptDetails.value = InvoiceModel.fromMap(receiptResponse);
        // print('bbbbbbb ${receiptDetails.value.userName}');
        print('vcgcgfgf');
        await PdfInvoice.makeReceipt(
            name: receiptDetails.value.userName,
            address: receiptDetails.value.userAddress,
            id: receiptDetails.value.buyId,
            date: receiptDetails.value.dateShipped,
            item: receiptDetails.value.productName,
            plan: receiptDetails.value.installmentPlan,
            price: receiptDetails.value.productPrice,
            totalPaid: receiptDetails.value.totalPaid,
            valid: receiptDetails.value.receiptValidTill,
            balance: receiptDetails.value.balanceDue,
            receiptType: receiptDetails.value.isBuyCompleted);
      });
    } catch (err) {
      print(err);
    }
  }
}
