import 'package:flutter/material.dart';

class ButtonExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Examples')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => print("ElevatedButton clicked"),
              child: Text('Submit'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => print("TextButton clicked"),
              child: Text('Cancel'),
            ),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.headset_rounded),
              onPressed: () => print("IconButton clicked"),
            ),
          ],
        ),
      ),
    );
  }
}
