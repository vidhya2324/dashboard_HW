import 'package:flutter/material.dart';

class CompliancePage extends StatelessWidget {
  const CompliancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compliance')),
      body: Center(child: Text('Compliance Page', style: TextStyle(fontSize: 20))),
    );
  }
}
