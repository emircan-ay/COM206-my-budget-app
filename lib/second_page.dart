import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPagestate();
}

class _SecondPagestate extends State<SecondPage> {
  List<String> harcamalar = [];
  final fiyatController = TextEditingController();
  final aciklamaController = TextEditingController();

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add expense'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: fiyatController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: aciklamaController,
                    decoration: const InputDecoration(
                      labelText: "label",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (fiyatController.text.isNotEmpty &&
                          aciklamaController.text.isNotEmpty) {
                        harcamalar.add(
                          "${fiyatController.text} TL - ${aciklamaController.text}",
                        );

                        fiyatController.clear();
                        aciklamaController.clear();
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: harcamalar.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(harcamalar[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          harcamalar.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

