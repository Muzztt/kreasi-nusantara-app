import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonData {
  String label;
  bool isSelected;

  ButtonData({required this.label, required this.isSelected});

  void toggleSelection() {
    isSelected = !isSelected;
  }
}

class Category extends StatelessWidget {
  final List<ButtonData> buttons;
  final Function(int) onButtonTap;

  const Category({super.key, required this.buttons, required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0, // Set a fixed height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (BuildContext context, int index) {
          final button = buttons[index];
          return GestureDetector(
            onTap: () => onButtonTap(index),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 40,
                width: 99.5,
                decoration: BoxDecoration(
                  color: button.isSelected
                      ? const Color(0xff980019)
                      : Colors.white,
                  border: Border.all(
                    color: const Color(0xffBE0924),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    button.label,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: button.isSelected
                          ? Colors.white
                          : const Color(0xffBE0924),
                      fontWeight:
                          button.isSelected ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
