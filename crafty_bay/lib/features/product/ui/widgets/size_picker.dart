import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected});

  final List<String> sizes;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String size in widget.sizes)
          GestureDetector(
            onTap: () {
              _selectedSize = size;
              setState(() {});
              widget.onSelected(_selectedSize!);
            },
            child: Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: _selectedSize == size ? AppColors.themeColor : null,
              ),
              child: Text(
                size,
                style: TextStyle(
                  color: _selectedSize == size ? Colors.white : null,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
      ],
    );
  }
}
