import 'package:flutter/material.dart';
import 'package:nc_flutter_threads/constants/sizes.dart';
import 'package:nc_flutter_threads/utils.dart';

class FormButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final GestureTapCallback onTap;

  const FormButton({
    super.key,
    required this.text,
    required this.disabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 300,
          ),
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size4,
            ),
            color: disabled
                ? isDarkMode(context)
                    ? Colors.grey.shade800
                    : Colors.grey.shade300
                : Colors.blue,
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(
              milliseconds: 300,
            ),
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
