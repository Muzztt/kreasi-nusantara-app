import 'package:flutter/material.dart';

class SizeData {
  String label;
  bool isSelected;

  SizeData({required this.label, required this.isSelected});

  void toggleSelection() {
    isSelected = !isSelected;
  }
}

class SizeSelector extends StatelessWidget {
  final List<SizeData> sizes;
  final Function(int) onButtonTap;

  const SizeSelector({
    Key? key,
    required this.sizes,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDisabled = sizes.isEmpty;

    return Container(
      height: 50.0, // Set a fixed height for the container
      child: isDisabled
          ? Center(
              child: Text(
                'No sizes available',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (BuildContext context, int index) {
                final button = sizes[index];
                return GestureDetector(
                  onTap: () => onButtonTap(index), // Only pass index
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8),
                    child: IntrinsicWidth(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: button.isSelected
                              ? const Color(0xffBE0924)
                              : Colors.white,
                          border: Border.all(
                            color: const Color(0xffBE0924),
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              button.label,
                              style: TextStyle(
                                fontSize: 14,
                                color: button.isSelected
                                    ? Colors.white
                                    : const Color(0xff980019),
                                fontWeight: button.isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
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
