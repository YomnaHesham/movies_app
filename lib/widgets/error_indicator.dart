import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Center(
        child: Text(
          "Something Went Wrong",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
