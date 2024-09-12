import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';

class BrowesItem extends StatelessWidget {
  String title;

  BrowesItem({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            "assets/images/test.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: AppTheme.blackBG.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
