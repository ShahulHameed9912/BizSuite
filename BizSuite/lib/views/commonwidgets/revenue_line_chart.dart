// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum RevenueRange { day, week, month }

enum chartType { line, bar, area }

class RevenueLineChart extends StatefulWidget {
  final String title;
  final chartType type;

  const RevenueLineChart({super.key, required this.title, required this.type});

  @override
  State<RevenueLineChart> createState() => _RevenueLineChartState();
}

class _RevenueLineChartState extends State<RevenueLineChart> {
  RevenueRange _range = RevenueRange.week;

  // ---------------- DATA ----------------
  final Map<RevenueRange, List<String>> xLabels = {
    RevenueRange.day: ['0', '4', '8', '12', '16', '20', '24'],
    RevenueRange.week: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    RevenueRange.month: ['W1', 'W2', 'W3', 'W4'],
  };

  final Map<RevenueRange, List<FlSpot>> blackLineData = {
    RevenueRange.day: const [
      FlSpot(0, 20),
      FlSpot(1, 30),
      FlSpot(2, 25),
      FlSpot(3, 40),
      FlSpot(4, 35),
      FlSpot(5, 28),
      FlSpot(6, 30),
    ],
    RevenueRange.week: const [
      FlSpot(0, 40),
      FlSpot(1, 25),
      FlSpot(2, 30),
      FlSpot(3, 18),
      FlSpot(4, 40),
      FlSpot(5, 20),
      FlSpot(6, 22),
    ],
    RevenueRange.month: const [
      FlSpot(0, 30),
      FlSpot(1, 45),
      FlSpot(2, 25),
      FlSpot(3, 50),
    ],
  };

  final Map<RevenueRange, List<FlSpot>> pinkLineData = {
    RevenueRange.day: const [
      FlSpot(0, 25),
      FlSpot(1, 35),
      FlSpot(2, 30),
      FlSpot(3, 50),
      FlSpot(4, 45),
      FlSpot(5, 32),
      FlSpot(6, 38),
    ],
    RevenueRange.week: const [
      FlSpot(0, 30),
      FlSpot(1, 35),
      FlSpot(2, 55),
      FlSpot(3, 30),
      FlSpot(4, 60),
      FlSpot(5, 32),
      FlSpot(6, 34),
    ],
    RevenueRange.month: const [
      FlSpot(0, 40),
      FlSpot(1, 55),
      FlSpot(2, 35),
      FlSpot(3, 60),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _revenueHeader(),
        const SizedBox(height: 10),
        _chartPlaceholder(),
      ],
    );
  }

  Widget _chartPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      alignment: Alignment.center,
      child: switch (widget.type) {
        chartType.line => _chart(),
        chartType.area => _chartWithArea(),
        chartType.bar => _barChart(),
      },
    );
  }

  Widget _revenueHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        ToggleButtons(
          isSelected: [
            _range == RevenueRange.month,
            _range == RevenueRange.week,
            _range == RevenueRange.day,
          ],
          borderRadius: BorderRadius.circular(8),
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Monthly'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Weekly'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Today'),
            ),
          ],
          onPressed: (index) {
            setState(() {
              _range = RevenueRange.values[[2, 1, 0][index]];
            });
          },
        ),
      ],
    );
  }

  // ---------------- CHART ----------------
  Widget _chart() {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: LineChart(
        LineChartData(
          minY: 10,
          maxY: 60,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
          titlesData: _titles(),
          lineBarsData: [
            _line(blackLineData[_range]!, Colors.black),
            _line(pinkLineData[_range]!, Colors.pinkAccent),
          ],
        ),
      ),
    );
  }

  Widget _chartWithArea() {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: LineChart(
        LineChartData(
          minY: 10,
          maxY: 60,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
          titlesData: _titles(),
          lineBarsData: [
            _line(pinkLineData[_range]!, Colors.grey).copyWith(
              belowBarData: BarAreaData(show: true, color: Colors.grey),
            ),
            _line(blackLineData[_range]!, Colors.black).copyWith(
              belowBarData: BarAreaData(show: true, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _barChart() {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: BarChart(
        BarChartData(
          minY: 10,
          maxY: 60,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
          titlesData: _titles(),
          barGroups: blackLineData[_range]!
              .map(
                (spot) => BarChartGroupData(
                  x: spot.x.toInt(),
                  barRods: [
                    BarChartRodData(
                      toY: spot.y,
                      color: Colors.black,
                      width: 12,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // ---------------- TITLES ----------------
  FlTitlesData _titles() {
    return FlTitlesData(
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 10,
          getTitlesWidget: (value, _) => Text(
            value.toInt().toString(),
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            final labels = xLabels[_range]!;
            return Text(
              labels[value.toInt()],
              style: const TextStyle(fontSize: 10),
            );
          },
        ),
      ),
    );
  }

  // ---------------- LINE ----------------
  LineChartBarData _line(List<FlSpot> data, Color color) {
    return LineChartBarData(
      spots: data,
      isCurved: true,
      color: color,
      barWidth: 2,
      dotData: const FlDotData(show: false),
    );
  }
}
