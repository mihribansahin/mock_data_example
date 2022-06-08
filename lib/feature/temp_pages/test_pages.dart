import 'package:flutter/material.dart';

class TestA extends StatelessWidget {
  const TestA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("SEARCH PAGE")));
  }
}

////////////////////////
class TestB extends StatelessWidget {
  const TestB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("GRAPHIC PAGE")));
  }
} ////////////////////////

class TestC extends StatelessWidget {
  const TestC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("PROFILE PAGE")));
  }
}
