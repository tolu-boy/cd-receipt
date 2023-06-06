// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MessageModel {
//   final String phone;
//   final String id;
//   final bool? shouldSend;
//
//   MessageModel({
//     required this.phone,
//     this.shouldSend,
//     required this.id,
//   });
//
//   static MessageModel fromSnapshot(DocumentSnapshot snapshot) {
//     // print(snapshot.id);
//     return MessageModel(
//       phone: snapshot.get("phone") ?? 0,
//       shouldSend: snapshot.get("shouldSend") ?? '',
//       id: snapshot.get("id") ?? '',
//     );
//   }
// }
