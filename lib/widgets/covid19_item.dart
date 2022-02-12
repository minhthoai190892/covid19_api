import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CovidItem extends StatelessWidget {
  CovidItem(this.title, this.value, {Key? key}) : super(key: key);
  String title;
  String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7, //bóng
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(20),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
