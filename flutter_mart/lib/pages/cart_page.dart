import 'package:flutter/material.dart';
import 'package:flutter_mart/model/product_model.dart';
import 'package:flutter_mart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        return ListView.builder(itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.80,
                child: ListView.builder(
                  itemCount: cartProvider.products.length,
                  itemBuilder: (context, index) {
                    ProductModel product = cartProvider.products[index];
                    return ListTile(
                      title: Text(product.name),
                      onLongPress: (){
                        cartProvider.remove(product);
                      },
                    );
                  },
                ),
              ),
              Text("Cart total ${cartProvider.getCartTotal()}")
            ],
          );
        });
      }),
    );
  }
}
