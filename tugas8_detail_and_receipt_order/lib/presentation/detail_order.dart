// import 'package:flutter/material.dart';
// import 'package:tugas8_detail_and_receipt_order/core/app_button.dart';
// import 'package:tugas8_detail_and_receipt_order/core/app_color.dart';

// class DetailOrderScreen extends StatefulWidget {
//   const DetailOrderScreen({super.key});

//   @override
//   State<DetailOrderScreen> createState() => _DetailOrderScreenState();
// }

// class _DetailOrderScreenState extends State<DetailOrderScreen> {
//   // ..
//   // bikin list dlu buat nampung datac
//   // ato namanya "Named Parameter" kyknya si (lupa juga soalnya)
//   // ..

//   final List<Map<String, dynamic>> tickets = [
//     {
//       'name': 'Tiket Masuk Dewasa / Anak',
//       'category': 'Nusantara',
//       'price': 50000,
//       'count': 0,
//     },
//   ];

//   // ...
//   // ni nuat ngitung tiap nambah atau ngurang kuantitasnya
//   // btw dari double getTotalPrice() sampe bawah
//   // itu beberapa minta tolong GPT
//   // kurang paham soalnya bang😅🙏
//   // ..

//   // double getTotalPrice() {
//   //   return tickets.fold(
//   //     0,
//   //     (sum, ticket) => sum + (ticket['count'] * ticket['price']),
//   //   );
//   // }

//   // void updateCount(int index, int delta) {
//   //   setState(() {
//   //     tickets[index]['count'] = (tickets[index]['count'] + delta).clamp(0, 99);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Detail Pesanan',
//           style: TextStyle(fontSize: 24, color: AppColor.mainColor),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: tickets.length,
//                 itemBuilder: (context, index) {
//                   final ticket = tickets[index];
//                   return Card(
//                     elevation: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 ticket['name'],
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 ticket['category'],
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 'Rp. 50.000 ✕ 2',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           // Row(
//                           //   children: [
//                           //     IconButton(
//                           //       icon: Icon(Icons.remove),
//                           //       onPressed: () => updateCount(index, -1),
//                           //     ),
//                           //     Text(
//                           //       ticket['count'].toString(),
//                           //       style: TextStyle(
//                           //         fontSize: 16,
//                           //         fontWeight: FontWeight.bold,
//                           //       ),
//                           //     ),
//                           //     IconButton(
//                           //       icon: Icon(Icons.add),
//                           //       onPressed: () => updateCount(index, 1),
//                           //     ),
//                           //   ],
//                           // ),
//                           // Text(
//                           //   'Rp. ${(ticket['count'] * ticket['price']).toStringAsFixed(0)}',
//                           //   style: TextStyle(fontWeight: FontWeight.bold),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Total',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
            
//             Text(
//               'Rp. 100.000',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             // ElevatedButton(
//             //   onPressed: () {},
//             //   child: Text('Process'),
//             //   style: ElevatedButton.styleFrom(
//             //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//             //     textStyle: TextStyle(fontSize: 18),
//             //   ),
//             // ),
//             AppButton(label: 'Process', onPressed: () {}),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ---
// // yang ana matiin atau ana fugsi yg ana comment,
// // itu karna an blm sempet bikin dia berfungsi bang.
// // ---


import 'package:flutter/material.dart';

class DetailOrderScreen extends StatefulWidget {
  @override
  _DetailOrderScreenState createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  String selectedPayment = 'QRIS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Pesanan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Tiket Masuk Dewasa / Anak'),
                subtitle: Text('Nusantara \n Rp. 50.000 x 2'),
                trailing: Text('Rp. 100.000', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedPayment = 'QRIS'),
                  child: Column(
                    children: [
                      Icon(Icons.qr_code, size: 40, color: selectedPayment == 'QRIS' ? Colors.blue : Colors.grey),
                      Text('QRIS', style: TextStyle(color: selectedPayment == 'QRIS' ? Colors.blue : Colors.black)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedPayment = 'Tunai'),
                  child: Column(
                    children: [
                      Icon(Icons.money, size: 40, color: selectedPayment == 'Tunai' ? Colors.blue : Colors.grey),
                      Text('Tunai', style: TextStyle(color: selectedPayment == 'Tunai' ? Colors.blue : Colors.black)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedPayment = 'Transfer'),
                  child: Column(
                    children: [
                      Icon(Icons.account_balance, size: 40, color: selectedPayment == 'Transfer' ? Colors.blue : Colors.grey),
                      Text('Transfer', style: TextStyle(color: selectedPayment == 'Transfer' ? Colors.blue : Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Rp. 140.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Process', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}