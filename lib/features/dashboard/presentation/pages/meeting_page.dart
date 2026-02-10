import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Meeting')),
      body: Center(child: Text('Meeting Page', style: TextStyle(fontSize: 20))),
    );
  }
}
