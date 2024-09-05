import 'package:flutter/material.dart';
import 'package:flutter_mart/model/product_model.dart';
import 'package:flutter_mart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart)),
               IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/video");
              },
              icon: const Icon(Icons.video_collection_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/dropdown");
      }),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  ProductModel product = products[index];
                  return ListTile(
                    leading: Container(
                      height: 25,
                      width: 25,
                      color: product.color,
                    ),
                    title: Text(product.name),
                    trailing: Checkbox(
                        value: cartProvider.products.contains(product),
                        onChanged: (value) {
                          if (value == true) {
                            cartProvider.add(product);
                          } else {
                            cartProvider.remove(product);
                          }
                        }),
                  );
                }),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                   const Text(
                      "The below is the dropdown is normal dropdown"),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButton(
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      value: cartProvider.selecetedItem,
                      items: cartProvider.dropdown.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          cartProvider.setSelectedItem(newValue);
                        }
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("The below is the dropdown form field to make a ui like formfield"),
                  const SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    decoration:InputDecoration(
                       labelText: 'Select an Item', // Label above the dropdown
                        border:
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ), // Border around the dropdown
                        contentPadding:
                            const EdgeInsets.all(16.0), // Padding inside the dropdown
                        filled: true, // Background fill
                        fillColor: Colors.grey[200],  
                    ) ,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      value: cartProvider.selecetedItem,
                      items: cartProvider.dropdown.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          cartProvider.setSelectedItem(newValue);
                        }
                      }),


                ],
              ),
            ),
          )
        ],
      ),  
    );
  }
}
