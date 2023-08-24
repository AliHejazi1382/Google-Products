import 'package:flutter/cupertino.dart';
import 'package:google_product/ui/widget/product_tile.dart';

import '../../data/remote/server.dart';
import '../../state/root/app_state.dart';
import '../../state/widget/widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  void _handleAddToCart(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  void _handleRemoveFromCart(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  Widget _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      isPurchased: AppStateScope.of(context).itemInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id, context),
      onRemoveFromCart: () => _handleRemoveFromCart(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> productList = AppStateScope.of(context).productList;
    return Column(
      children:
      productList.map((id) => _buildProductTile(id, context)).toList(),
    );
  }
}
