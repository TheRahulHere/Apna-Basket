import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No orders found."),
            );
          }

          final orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final orderItems = order["items"] as List<dynamic>;
              final timestamp = order["timestamp"] as Timestamp;
              final date =
              DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text("Order #${order.id.substring(0, 8)}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date: ${date.toLocal()}"),
                      Text("Address: ${order["address"]}"),
                      const Text("Items:"),
                      for (var item in orderItems)
                        Text("- ${item["name"]} (\$${item["price"]})"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
