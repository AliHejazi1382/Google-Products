import 'package:flutter/material.dart';
import 'package:google_product/data/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final bool isPurchased;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;

  const ProductTile({
    super.key,
    required this.product,
    required this.isPurchased,
    required this.onAddToCart,
    required this.onRemoveFromCart
  });

  @override
  Widget build(BuildContext context) {

    Color getButtonColor(Set<MaterialState> states) {
      return isPurchased ? Colors.grey : Colors.black;
    }

    BorderSide getButtonBorder(Set<MaterialState> states) {
      return BorderSide(
        color: isPurchased ? Colors.grey : Colors.black,
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      color: const Color(0xfff8f8f8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(product.title),
          ),
          Text.rich(
            product.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OutlinedButton(
              child: isPurchased
                  ? const Text('Remove from cart')
                  : const Text('Add to cart'),
              style: ButtonStyle(
                foregroundColor:
                MaterialStateProperty.resolveWith(getButtonColor),
                side: MaterialStateProperty.resolveWith(getButtonBorder),
              ),
              onPressed: isPurchased ? onRemoveFromCart : onAddToCart,
            ),
          ),
          Image.network(product.pictureURL),
        ],
      ),
    );
  }
}