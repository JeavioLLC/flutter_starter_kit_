import 'package:flutter/material.dart';

class ListBottomLoader extends StatelessWidget {
  const ListBottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
