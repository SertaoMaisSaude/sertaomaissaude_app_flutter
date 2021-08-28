import 'package:flutter/material.dart';

class SelectCardWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function selectFunction;

  SelectCardWidget(
      {@required this.isSelected,
      @required this.title,
      @required this.selectFunction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: GestureDetector(
        onTap: selectFunction,
        child: AnimatedContainer(
          width: size.width * 0.4,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _setColor(isSelected),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, offset: Offset(0, 4), color: Colors.grey[300])
            ],
          ),
          duration: Duration(milliseconds: 700),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected == null || isSelected
                      ? Colors.white
                      : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Color _setColor(bool selected) {
    if (selected == null || !selected) {
      return Colors.white;
    } else {
      return Color(0xFF43D7A1);
    }
  }
}
