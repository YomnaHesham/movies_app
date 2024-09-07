import 'package:flutter/material.dart';

class NotAvailableIndicator extends StatelessWidget {
  const NotAvailableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Center(
        child: Text(
          "No data available",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
