import 'package:flutter/material.dart';

class SelectedOptionPage extends StatelessWidget {
  final String selectedOption;

  SelectedOptionPage(this.selectedOption);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Option'),
      ),
      body: Center(
        child: Text(
          'Selected Option: $selectedOption',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
