import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tel/myPdf.dart';
import 'MyHomePage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'controllers/messageController.dart';
import 'controllers/invoiceController.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: "AIzaSyCWdl5s5mtOE87Gz_LP2Y6Mj6bz-b-Qhf8",
  //   appId: "1:319451614306:web:0faf5724d29df31148d53b",
  //   messagingSenderId: "319451614306",
  //   projectId: "testdb-5f477",
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Receipt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        // Get.put<MessageController>(MessageController());
        Get.put<InvoiceController>(InvoiceController());
      }),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/receipt/:id',
          page: () => Mypdf(),
        ),
        GetPage(
          name: '/',
          page: () => const MyHomePage(),
        ),
      ],
    );
  }
}

// messages.snapshots().listen(
//   (event) {
//     print(event);
//     allMessages = event.docs.map((me) => me.data()).toList();
//     print(allMessages);
//     // print('ssss ${allOrders[0].orderId}');
//     // print("listener attached ${event.docs[0].data()}");
//   },
//   onError: (error) => print("Listen failed: $error"),
// );

// allMessages = person;
// return allMessages;
// for (var doc in event.docs) {
//   print("${doc.id} => ${doc.data()}");
//   allMessages = doc.data()
// }
