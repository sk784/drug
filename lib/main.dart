import 'package:drug/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => Data(),
          child: MyHomePage(title: 'Drug Pages')),
    );
  }
}

