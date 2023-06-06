import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tel/api/pdf_invoice.dart';
import 'package:tel/api/pdf_paragraph_api.dart';
import 'api/pdf_api.dart';
import 'controllers/invoiceController.dart';

class Mypdf extends StatefulWidget {
  Mypdf({Key? key}) : super(key: key);
  @override
  State<Mypdf> createState() => _MypdfState();
}

class _MypdfState extends State<Mypdf> {
  final InvoiceController invoiceController = Get.find<InvoiceController>();
  String? data = Get.parameters["id"];

  @override
  void initState() {
    // TODO: implement initState
    print('dddd$data');
    invoiceController.getReceiptDetails(data!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Text('Your receipt will be downloaded shortly')],
          ),
        ],
      ),
    );
  }
}
