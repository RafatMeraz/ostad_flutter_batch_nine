import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (String? value) {
        // TODO: Search the product
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
