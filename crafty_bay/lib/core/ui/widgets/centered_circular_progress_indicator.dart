import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}