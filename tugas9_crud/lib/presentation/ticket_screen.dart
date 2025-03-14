import 'package:flutter/material.dart';
import 'package:tugas9_crud/core/app_button.dart';
import 'package:tugas9_crud/core/app_color.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
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


void addTicket() {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String selectedCategory = 'Nusantara'; // Default category

  showDialog(
    context: context,
    barrierDismissible: false, // Membuat background gelap & tidak bisa ditutup dengan klik luar
    builder: (context) {
      return AlertDialog(
        title: Text('Tambah Ticket'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Ticket'),
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: ['Nusantara', 'Mancanegara']
                  .map((cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      ))
                  .toList(),
              onChanged: (value) {
                selectedCategory = value!;
              },
              decoration: InputDecoration(labelText: 'Kategori'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tickets.add({
                  'name': nameController.text,
                  'category': selectedCategory,
                  'price': int.tryParse(priceController.text) ?? 0,
                  'count': 0,
                });
              });
              Navigator.pop(context);
            },
            child: Text('Tambah'),
          ),
        ],
      );
    },
  );
}

  void editTicket(int index) {
    final ticket = tickets[index];
    TextEditingController nameController =
        TextEditingController(text: ticket['name']);
    TextEditingController categoryController =
        TextEditingController(text: ticket['category']);
    TextEditingController priceController =
        TextEditingController(text: ticket['price'].toString());
        String selectedCategory = 'Nusantara'; 

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama Ticket'),
              ),
              // TextField(
              //   controller: categoryController,
              //   decoration: InputDecoration(labelText: 'Kategori'),
              // ),
              DropdownButtonFormField<String>(
              value: selectedCategory,
              items: ['Nusantara', 'Mancanegara']
                  .map((cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      ))
                  .toList(),
              onChanged: (value) {
                selectedCategory = value!;
              },
              decoration: InputDecoration(labelText: 'Kategori'),
            ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tickets[index] = {
                    'name': nameController.text,
                    'category': categoryController.text,
                    'price': int.tryParse(priceController.text) ?? 0,
                    'count': ticket['count'],
                  };
                });
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void deleteTicket(int index) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text('Konfirmasi'),
        content: Text('Anda yakin mau menghapus tiket?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tickets.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ticket',
          style: TextStyle(fontSize: 24, color: AppColor.mainColor),
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
                      child: Column(
                        children: [
                          Row(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => editTicket(index),
                                child: Text('Edit'),
                              ),
                              TextButton(
                                onPressed: () => deleteTicket(index),
                                child: Text(
                                  'Hapus',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            AppButton(
              label: 'Tambah Ticket',
              onPressed: addTicket,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. ${getTotalPrice().toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AppButton(
                  label: 'Process',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
