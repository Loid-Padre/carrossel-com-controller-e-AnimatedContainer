import 'package:flutter/material.dart';

class SlidTile extends StatelessWidget {
  final String image;
  final bool activePage;

  const SlidTile({Key key, @required this.image, @required this.activePage})
      : assert(image != null);
  @override
  Widget build(BuildContext context) {
    final double top = this.activePage ? 20 : 120;
    final double blur = this.activePage ? 25 : 0;
    final double offset = this.activePage ? 20 : 0;
    return AnimatedContainer(
      curve: Curves.easeInOutQuint,
      duration: Duration(
        milliseconds: 500,
      ),
      margin: EdgeInsets.only(
        top: top,
        bottom: 50,
        right: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
    );
  }
}
