import 'package:flutter/material.dart';
import 'country_list_page.dart';  // 나라 목록 파일

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white, // 글자/아이콘 색
        ),
      ),
    home: CountryListPage(),  // 첫 화면//
    );
  }
}
