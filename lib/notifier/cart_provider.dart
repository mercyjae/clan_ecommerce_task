import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  String _selectedStorage = "1 TB";

  String get selectedStorage => _selectedStorage;

  void selectStorage(String storage) {
    _selectedStorage = storage;
    notifyListeners();
  }

  final List<Products> _allProducts = [
    Products(
        id: '1',
        name: "AirPods",
        price: 132.00,
        rating: "4.9",
        image: 'assets/images/headset1.png',
        category: "Headphones",
        description: 'hello'),
    Products(
        id: '2',
        name: "MacBook Air 13",
        price: 1100.00,
        rating: "5.0",
        image: 'assets/images/laptop1.png',
        category: "Laptops",
        description: 'hello'),
    Products(
        id: '3',
        name: "iPhone 14",
        price: 999.00,
        rating: "4.8",
        image: 'assets/images/phone1.png',
        category: "Smartphones",
        description: 'hello'),
    Products(
        id: '4',
        name: "AirPods",
        price: 132.00,
        rating: "4.9",
        image: 'assets/images/headset2.png',
        category: "Headphones",
        description: 'hello'),
    Products(
        id: '5',
        name: "Gaming GPU",
        price: 800.00,
        rating: "4.7",
        image: 'assets/images/laptop2.png',
        category: "Laptops",
        description: 'hello'),
    Products(
        id: '6',
        name: "iPhone 14",
        price: 999.00,
        rating: "4.8",
        image: 'assets/images/phone2.png',
        category: "Smartphones",
        description: 'hello'),
    Products(
        id: '7',
        name: "AirPods",
        price: 132.00,
        rating: "4.9",
        image: 'assets/images/headset3.png',
        category: "Headphones",
        description: 'hello'),
    Products(
        id: '8',
        name: "Gaming GPU",
        price: 800.00,
        rating: "4.7",
        image: 'assets/images/laptop3.png',
        category: "Laptops",
        description: 'hello'),
    Products(
        id: '9',
        name: "iPhone 14",
        price: 999.00,
        rating: "4.8",
        image: 'assets/images/phone3.png',
        category: "Smartphones",
        description: 'hello'),
  ];

  String _selectedCategory = "All";

  List<Products> get allProducts => _allProducts;

  String get selectedCategory => _selectedCategory;

  List<Products> get filteredProducts {
    if (_selectedCategory == "All") {
      return _allProducts;
    } else {
      return _allProducts
          .where((product) => product.category == _selectedCategory)
          .toList();
    }
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }


  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

 
  void addToCart(Products product) {
    final existingItemIndex =
        _cartItems.indexWhere((item) => item["product"].id == product.id);

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex]["quantity"]++;
    } else {
      _cartItems.add({"product": product, "quantity": 1});
    }
    notifyListeners();
  }


  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item["product"].id == productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    final existingItemIndex =
        _cartItems.indexWhere((item) => item["product"].id == productId);

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex]["quantity"]++;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final existingItemIndex =
        _cartItems.indexWhere((item) => item["product"].id == productId);

    if (existingItemIndex != -1 &&
        _cartItems[existingItemIndex]["quantity"] > 1) {
      _cartItems[existingItemIndex]["quantity"]--;
      notifyListeners();
    }
  }

  double get subtotalPrice {
    return _cartItems.fold(
      0.0,
      (total, item) => total + (item["product"].price * item["quantity"]),
    );
  }

  double get deliveryFee => 5.0;

  double get discount => subtotalPrice * 0.4;

  double get total => subtotalPrice - discount + deliveryFee;
}

