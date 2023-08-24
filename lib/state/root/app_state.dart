import 'package:flutter/material.dart';

class AppState {
  final List<String> productList;
  final Set<String> itemInCart;

  const AppState(
      {required this.productList, this.itemInCart = const <String>{}});

  AppState copyWith({List<String>? productList, Set<String>? itemInCart}) {
    return AppState(
        productList: productList ?? this.productList,
        itemInCart: itemInCart ?? this.itemInCart);
  }
}

class AppStateScope extends InheritedWidget {
  final AppState data;

  const AppStateScope(this.data, {super.key, required super.child});

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data == oldWidget.data;
  }
}
