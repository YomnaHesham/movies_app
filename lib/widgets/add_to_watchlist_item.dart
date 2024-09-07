import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';

class AddToWatchlistItem extends StatefulWidget {
  AddToWatchlistItem({super.key});

  @override
  State<AddToWatchlistItem> createState() => _AddToWatchlistItemState();
}

class _AddToWatchlistItemState extends State<AddToWatchlistItem> {
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        !isTaped;
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            width: 32,
            decoration: BoxDecoration(
              color:
                  isTaped ? AppTheme.grayBG.withOpacity(0.8) : AppTheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: Icon(
                !isTaped ? Icons.add : Icons.done,
                color: AppTheme.white,
                size: 24,
              ),
            ),
          ),
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              width: 32,
              padding: const EdgeInsets.all(8),
              color:
                  !isTaped ? AppTheme.grayBG.withOpacity(0.8) : AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.moveTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
