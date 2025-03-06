import 'package:flutter/material.dart';
import 'package:tugas7_item_product/core/app_color.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  // ..
  // bikin list dlu buat nampung data
  // ato namanya "Named Parameter" kyknya si (lupa juga soalnya)
  // ..

  final List<Map<String, dynamic>> tickets = [
    {
      'name': 'Tiket Masuk Dewasa / Anak',
      'category': 'Nusantara',
      'price': 50000,
      'count': 0,
    },
    {
      'name': 'Tiket Masuk Dewasa / Anak',
      'category': 'Mancanegara',
      'price': 100000,
      'count': 0,
    },
  ];

  // ...
  // ni nuat ngitung tiap nambah atau ngurang kuantitasnya
  // btw dari double getTotalPrice() sampe bawah
  // itu beberapa minta tolong GPT
  // kurang paham soalnya bang😅🙏
  // ..

  double getTotalPrice() {
    return tickets.fold(
      0,
      (sum, ticket) => sum + (ticket['count'] * ticket['price']),
    );
  }

  void updateCount(int index, int delta) {
    setState(() {
      tickets[index]['count'] = (tickets[index]['count'] + delta).clamp(0, 99);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket',
          style: TextStyle(
            fontSize: 24,
            color: AppColor.mainColor,
            ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticket['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ticket['category'],
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. ${ticket['price'].toStringAsFixed(0)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => updateCount(index, -1),
                              ),
                              Text(
                                ticket['count'].toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => updateCount(index, 1),
                              ),
                            ],
                          ),
                          Text(
                            'Rp. ${(ticket['count'] * ticket['price']).toStringAsFixed(0)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp. ${getTotalPrice().toStringAsFixed(0)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Process'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
