import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'controllers/messageController.dart';
import 'model/messageModel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // final MessageController messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Welcome'),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text('send message'),
          // ),
          // SizedBox(
          //     height: 400,
          //     child: Obx(
          //       () {
          //         return messageController.allNumbers.isEmpty
          //             ? const Center(child: Text("Nothing to show here"))
          //             : ListView.builder(
          //                 scrollDirection: Axis.vertical,
          //                 itemCount: messageController.allNumbers.length,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   var message = messageController.allNumbers[index];
          //                   return Container(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 20),
          //                     child: Column(
          //                       children: [
          //                         Row(
          //                           children: [
          //                             Text(message.phone),
          //                             const SizedBox(width: 30),
          //                             ElevatedButton(
          //                               onPressed: () {
          //                                 print(message.shouldSend);
          //                                 print(message.id);
          //                                 messageController
          //                                     .updateSender(message.id);
          //                               },
          //                               child: const Text('send message'),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: 30),
          //                       ],
          //                     ),
          //                     // child: OrderTile(
          //                     //   orderModel: orderController.allOrders[index],
          //                     // ),
          //                   );
          //                 },
          //               );
          //       },
          //     )),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.toNamed(
          //       "/receipt/gbZhIMeLK5MTpw6fjJEM",
          //     );
          //   },
          //   child: Text('try receipt'),
          // ),
        ],
      ),
    );
  }
}
