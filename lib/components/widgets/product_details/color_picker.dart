import 'package:flutter/cupertino.dart';

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  const ColorPicker({super.key, required this.outerBorder, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder? Border.all(color: color,width: 2):null
      ),
      child: Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: color,
      ),
      ),
    );
  }
}
