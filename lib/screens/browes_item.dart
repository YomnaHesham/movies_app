import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';

class BrowesItem extends StatelessWidget {
  const BrowesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            "assets/images/test.png",
            width: 158,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.blackBG.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              "Action",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}
