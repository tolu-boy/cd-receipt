class InvoiceModel {
  final String userName;
  final String userEmail;
  final String userAddress;
  final String userPhoneNumber;
  final String productName;
  final num productPrice;
  final String installmentPlan;
  final String balanceDue;
  final String? receiptValidTill;
  final bool isBuyCompleted;
  final String buyId;
  final String? productSerialNumber;
  final String dateShipped;
  final num totalPaid;

  InvoiceModel(
      {required this.userName,
      required this.userEmail,
      required this.userAddress,
      required this.userPhoneNumber,
      required this.productName,
      required this.productPrice,
      required this.installmentPlan,
      required this.isBuyCompleted,
      required this.buyId,
      required this.totalPaid,
      required this.balanceDue,
      required this.receiptValidTill,
      required this.productSerialNumber,
      required this.dateShipped});

  static InvoiceModel fromMap(Map<String, dynamic> map) {
    // print(map);
    return InvoiceModel(
      userName: map["userName"],
      userEmail: map["userEmail"],
      userAddress: map["userAddress"],
      userPhoneNumber: map["userPhoneNumber"],
      productName: map["productName"],
      productPrice: map["productPrice"],
      installmentPlan: map["installmentPlan"],
      isBuyCompleted: map["isBuyCompleted"],
      productSerialNumber: map["productSerialNumber"],
      dateShipped: map["dateShipped"],
      buyId: map["buyId"],
      totalPaid: map["totalPaid"],
      receiptValidTill: map["receiptValidTill"],
      balanceDue: map["balanceDue"],
    );
  }

  static InvoiceModel empty() {
    return InvoiceModel(
      userName: '',
      userEmail: '',
      userAddress: '',
      userPhoneNumber: '',
      productName: '',
      productPrice: 0,
      installmentPlan: '',
      isBuyCompleted: true,
      productSerialNumber: '',
      dateShipped: '',
      buyId: '',
      totalPaid: 0,
      receiptValidTill: '',
      balanceDue: '',
    );
  }
}
