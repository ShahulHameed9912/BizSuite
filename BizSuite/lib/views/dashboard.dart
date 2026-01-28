import 'package:bizsuite/views/commonwidgets/appbar_widget.dart';
import 'package:bizsuite/views/commonwidgets/revenue_line_chart.dart';
import 'package:bizsuite/views/commonwidgets/statcard_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Dashboard'),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statsGrid(),
          const SizedBox(height: 16),
          RevenueLineChart(title: "Revenue", type: chartType.line),
        ],
      ),
    );
  }

  Widget _statsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: [
        StatCard(
          title: 'Total Products',
          value: '180',
          progress: 0.3,
          dark: true,
          indicatorBgColor: Colors.grey.shade500,
          indicatorColor: Colors.white,
        ),
        StatCard(
          title: 'Total Orders',
          value: '210',
          progress: 0.7,
          indicatorBgColor: Colors.blue.shade100,
          indicatorColor: Colors.blue,
        ),
        StatCard(
          title: 'Total Clients',
          value: '150',
          progress: 0.7,
          indicatorBgColor: Colors.green.shade100,
          indicatorColor: Colors.green,
        ),
        StatCard(
          title: 'Revenue',
          value: '110',
          progress: 0.7,
          indicatorBgColor: Colors.purple.shade100,
          indicatorColor: Colors.purple,
        ),
      ],
    );
  }
}
