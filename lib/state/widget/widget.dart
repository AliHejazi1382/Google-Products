import 'package:flutter/material.dart';
import 'package:google_product/data/remote/server.dart';
import 'package:google_product/state/root/app_state.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child, super.key});

  @override
  AppStateWidgetState createState() {
    return AppStateWidgetState();
  }
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(productList: Server.getProductList(),);

  void setProductList(List<String> newProductList) {
    if (_data.productList != newProductList) {
      setState(() {
        _data = _data.copyWith(productList: newProductList);
      });
    }
  }

  void addToCart(String id) {
    if (!_data.itemInCart.contains(id)) {
      final newItemsInCart = Set<String>.from(_data.itemInCart);
      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(itemInCart: newItemsInCart);
      });
    }
  }

  void removeFromCart(String id) {
    if (_data.itemInCart.contains(id)) {
      final newItemsInCart = Set<String>.from(_data.itemInCart);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(itemInCart: newItemsInCart);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(_data, child: widget.child);
  }
}