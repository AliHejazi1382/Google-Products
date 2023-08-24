import 'package:flutter/material.dart';
import 'package:google_product/data/remote/server.dart';
import 'package:google_product/state/widget/widget.dart';
import 'package:google_product/ui/widget/cart_icon.dart';

import '../widget/product_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final _focusNode = FocusNode();
  bool _onSearch = false;
  final _controller = TextEditingController();

  void _toggleSearch(BuildContext context) {
    setState(() {
      _onSearch = !_onSearch;
    });
    AppStateWidget.of(context).setProductList(Server.getProductList());
    _controller.clear();
  }

  void _handleSearch(BuildContext context) {
    _focusNode.unfocus();
    final String filter = _controller.text;
    AppStateWidget.of(context)
        .setProductList(Server.getProductList(filter: filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network('$baseAssetURL/google-logo.png'),
            ),
            title: _onSearch
                ? TextField(
                    autofocus: true,
                    controller: _controller,
                    focusNode: _focusNode,
                    onSubmitted: (_) => _handleSearch(context),
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () => _handleSearch(context),
                          icon: const Icon(Icons.search),
                        ),
                        hintText: 'Search for purchase',
                        suffixIcon: IconButton(
                            onPressed: () => _toggleSearch(context),
                            icon: const Icon(Icons.close))),
                  )
                : null,
            actions: [
              if (!_onSearch)
                IconButton(
                    onPressed: () => _toggleSearch(context),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              const CartIcon()
            ],
            backgroundColor: Colors.white,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: ProductListWidget(),
          )
        ],
      ),
    );
  }
}
