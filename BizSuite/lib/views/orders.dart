import 'package:bizsuite/views/commonwidgets/appbar_widget.dart';
import 'package:bizsuite/views/commonwidgets/revenue_line_chart.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(title: "Orders"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RevenueLineChart(title: "Orders", type: chartType.bar),
            const SizedBox(height: 24),
            _orderListSection(),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: selected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  // ---------------- Order List ----------------

  Widget _orderListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Order List",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            _filterChip("Monthly"),
            _filterChip("Weekly", selected: true),
            _filterChip("Today"),
          ],
        ),
        const SizedBox(height: 16),
        _orderTile(
          initials: "JS",
          name: "John Smith",
          date: "Aug 21, 2024",
          amount: "+\$10.00",
        ),
        _orderTile(
          initials: "AJ",
          name: "Adam James",
          date: "Aug 21, 2024",
          amount: "+\$8.50",
        ),
        _orderTile(
          initials: "CD",
          name: "Clara David",
          date: "Aug 20, 2024",
          amount: "+\$14.00",
        ),
        _orderTile(
          initials: "EJ",
          name: "Emily John",
          date: "Aug 19, 2024",
          amount: "+\$12.30",
        ),
      ],
    );
  }

  Widget _orderTile({
    required String initials,
    required String name,
    required String date,
    required String amount,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade200,
            child: Text(
              initials,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "New Order",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
