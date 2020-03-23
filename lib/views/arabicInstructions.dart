import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ArabicInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طريقة الاستخدام"),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Carousel(
          images: [
            AssetImage('assets/screen.jpg'),
            AssetImage('assets/arabic1.jpg'),
            AssetImage('assets/arabic2.jpg'),
            AssetImage('assets/arabic3.jpg'),
            AssetImage('assets/arabic4.jpg'),
            AssetImage('assets/arabic5.jpg'),
            AssetImage('assets/arabic6.jpg'),
          ],
        ),
      ),
    );
  }
}
