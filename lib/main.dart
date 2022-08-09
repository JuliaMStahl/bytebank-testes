import 'package:bytebank/components/bytebank_theme.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp(contactDao: ContactDao(),));
}

class BytebankApp extends StatelessWidget {
  final ContactDao contactDao;

  BytebankApp({required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BytebankTheme,
      home: Dashboard(contactDao: ContactDao()),
    );
  }
}