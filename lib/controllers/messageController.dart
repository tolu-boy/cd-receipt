// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tel/model/messageModel.dart';
//
// class MessageController extends GetConnect {
//   RxList<MessageModel> allNumbers = <MessageModel>[].obs;
//
//   @override
//   // void onInit() {
//   //   super.onInit();
//   //   fetchNumbers();
//   // }
//
//   Future<void> fetchNumbers() async {
//     try {
//       final numbers = FirebaseFirestore.instance.collection('MessageData');
//       numbers.snapshots().listen(
//         (event) {
//           allNumbers.value = event.docs
//               .map((paymentsMap) => MessageModel.fromSnapshot(paymentsMap))
//               .toList();
//           print(allNumbers);
//           // print('ssss ${allOrders[0].orderId}');
//           // print("listener attached ${event.docs[0].data()}");
//         },
//         onError: (error) => print("Listen failed: $error"),
//       );
//       // print(allPayments.value);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<void> updateSender(String id) async {
//     try {
//       final messages =
//           FirebaseFirestore.instance.collection('MessageData').doc(id);
//       messages.update({'shouldSend': true});
//       print('kljkkl');
//       // print(allPayments.value);
//     } catch (e) {
//       print(e);
//     }
//   }
//
// // Future<void> confirmPayments(
//   //     {required String userId,
//   //     required num amount,
//   //     required String transferNarration,
//   //     required String paymentId,
//   //     required String companyName}) async {
//   //   Map<String, dynamic> data = {
//   //     "userId": userId,
//   //     "amount": amount,
//   //     "transferNarration": transferNarration,
//   //     "paymentId": paymentId,
//   //     "companyName": companyName
//   //   };
//   //
//   //   try {
//   //     showLoading();
//   //     var response =
//   //         await functions.httpsCallable('approveFundWallet').call(data);
//   //     // print(response);
//   //     dismissLoading();
//   //     showSuccessSnackBar("Payment Confirmed", "payment has been confirmed");
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
// }
