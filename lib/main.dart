import 'package:flutter/material.dart';
import 'product_list_pape.dart';

void main(){
  runApp(MYApp());
}

class MYApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ProductListPage(),
    );
  }
}