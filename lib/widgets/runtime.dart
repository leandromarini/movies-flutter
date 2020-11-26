import 'package:flutter/material.dart';

class Runtime extends StatelessWidget {
  final int runtime;

  const Runtime(this.runtime);

  String runtimeToHourFormat(var value) {
    if (value != null && value > 0) {
      final int hour = value ~/ 60;
      final int minutes = value % 60;
      return '${hour}h ${minutes}m';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        runtimeToHourFormat(runtime),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
