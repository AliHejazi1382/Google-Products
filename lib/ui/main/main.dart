import 'package:flutter/material.dart';
import 'package:google_product/state/widget/widget.dart';
import 'package:google_product/ui/page/main_page.dart';

void main() {
  runApp(const AppStateWidget(
      child: MaterialApp(
        home: MainPage(),
      )
  ));
}
