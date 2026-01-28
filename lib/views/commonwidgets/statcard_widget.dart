import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final double progress;
  final bool dark;
  final Color indicatorBgColor;
  final Color indicatorColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.progress,
    required this.indicatorBgColor,
    required this.indicatorColor,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = dark ? Theme.of(context).colorScheme.primary : Colors.white;
    final textColor = dark
        ? Colors.white
        : Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (!dark)
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: textColor.withOpacity(0.7))),
          const Spacer(),
          Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: indicatorBgColor,
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
