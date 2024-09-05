import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final Color color;
  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.color});
}

final List<ProductModel> products = [
  ProductModel(id: 0, name: "Laptop", price: 1499.90, color: Colors.amber),
  ProductModel(id: 1, name: "Smartphone", price: 899.99, color: Colors.blue),
  ProductModel(id: 2, name: "Headphones", price: 199.99, color: Colors.green),
  ProductModel(id: 3, name: "Smartwatch", price: 249.99, color: Colors.red),
  ProductModel(id: 4, name: "Tablet", price: 499.99, color: Colors.purple),
  ProductModel(id: 5, name: "Camera", price: 799.99, color: Colors.orange),
  ProductModel(
      id: 6, name: "Gaming Console", price: 399.99, color: Colors.grey),
  ProductModel(id: 7, name: "Keyboard", price: 99.99, color: Colors.cyan),
  ProductModel(id: 8, name: "Mouse", price: 49.99, color: Colors.teal),
  ProductModel(id: 9, name: "Monitor", price: 299.99, color: Colors.blueGrey),
  ProductModel(id: 10, name: "Printer", price: 129.99, color: Colors.lime),
  ProductModel(id: 11, name: "Router", price: 89.99, color: Colors.indigo),
  ProductModel(
      id: 12, name: "Speakers", price: 149.99, color: Colors.deepOrange),
  ProductModel(
      id: 13,
      name: "External Hard Drive",
      price: 119.99,
      color: Colors.deepPurple),
  ProductModel(id: 14, name: "Flash Drive", price: 19.99, color: Colors.pink),
  ProductModel(id: 15, name: "Webcam", price: 79.99, color: Colors.yellow),
  ProductModel(id: 16, name: "Charger", price: 29.99, color: Colors.lightBlue),
  ProductModel(
      id: 17, name: "Projector", price: 549.99, color: Colors.lightGreen),
  ProductModel(id: 18, name: "Smart TV", price: 999.99, color: Colors.brown),
  ProductModel(
      id: 19, name: "VR Headset", price: 399.99, color: Colors.pinkAccent),
];

