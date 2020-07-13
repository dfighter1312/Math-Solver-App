import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';
import '../methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const backgroundMainColor = Color(0xFFF2F2F2);

class SimplexLearningPageState extends State<SimplexLearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundMainColor,
      appBar: AppBar(
        title: Text(
          'Simplex Method',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: DetailedDescription(method: 'Simplex Method'),
      drawer: DrawTab(),
    );
  }
}

class SimplexLearningPage extends StatefulWidget {
  @override
  SimplexLearningPageState createState() => SimplexLearningPageState();
}

