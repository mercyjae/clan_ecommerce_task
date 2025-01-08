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
        price: 150.00,
        rating: "3.9",
        color: 'Green',
        image: 'assets/images/headset1.png',
        category: "Headphones",
        description:
            "They’re powerful, sleek, and efficient. Crafted to deliver immersive audio, seamless connectivity, and exceptional performance, these AirPods redefine your listening experience for work, play, and relaxation."),
    Products(
        id: '2',
        name: "MacBook Pro 13",
        price: 1100.00,
        rating: "5.0",
        color: 'Grey',
        image: 'assets/images/laptop1.png',
        category: "Laptops",
        description:
            'Its a powerful, sleek, and efficient. It is designed to boost productivity and deliver exceptional performance for work, study, and entertainment.'),
    Products(
        id: '3',
        name: "iPhone 13",
        price: 809.00,
        rating: "4.8",
        color: 'Grey',
        image: 'assets/images/phone1.png',
        category: "Smartphones",
        description:
            "It's powerful, sleek, and efficient. Designed to enhance your productivity and provide exceptional performance for work, communication, and entertainment, this phone is your ultimate companion for a connected lifestyle."),
    Products(
        id: '4',
        name: "AirPods",
        price: 132.00,
        rating: "4.1",
        color: 'Green',
        image: 'assets/images/headset2.png',
        category: "Headphones",
        description:
            "They’re powerful, sleek, and efficient. Crafted to deliver immersive audio, seamless connectivity, and exceptional performance, these AirPods redefine your listening experience for work, play, and relaxation."),
    Products(
        id: '5',
        name: "Gaming GPU",
        price: 800.00,
        rating: "4.2",
        color: 'White',
        image: 'assets/images/laptop2.png',
        category: "Laptops",
        description:
            'Its a powerful, sleek, and efficient. It is designed to boost productivity and deliver exceptional performance for work, study, and entertainment.'),
    Products(
        id: '6',
        name: "iPhone 14",
        price: 1200.00,
        rating: "4.8",
        image: 'assets/images/phone2.png',
        category: "Smartphones",
        color: 'Grey',
        description:
            "It's powerful, sleek, and efficient. Designed to enhance your productivity and provide exceptional performance for work, communication, and entertainment, this phone is your ultimate companion for a connected lifestyle."),
    Products(
        id: '7',
        name: "AirPods",
        price: 189.00,
        rating: "4.9",
        image: 'assets/images/headset3.png',
        category: "Headphones",
        color: 'Green',
        description:
            "They’re powerful, sleek, and efficient. Crafted to deliver immersive audio, seamless connectivity, and exceptional performance, these AirPods redefine your listening experience for work, play, and relaxation."),
    Products(
        id: '8',
        name: "Dell CPU",
        price: 800.00,
        rating: "3.3",
        image: 'assets/images/laptop3.png',
        category: "Laptops",
        color: 'Grey',
        description:
            'Its a powerful, sleek, and efficient. It is designed to boost productivity and deliver exceptional performance for work, study, and entertainment.'),
    Products(
        id: '9',
        name: "iPhone 14",
        price: 4409.00,
        rating: "4.8",
        image: 'assets/images/phone3.png',
        category: "Smartphones",
        color: 'Black',
        description:
            "It's powerful, sleek, and efficient. Designed to enhance your productivity and provide exceptional performance for work, communication, and entertainment, this phone is your ultimate companion for a connected lifestyle."),
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

  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String? _promoCode;
  double _promoDiscount = 0;

  String? get promoCode => _promoCode;
  double get promoDiscount => _promoDiscount;
  bool _isPromoCodeApplied = false; // Tracks promo code state
  bool get isPromoCodeApplied => _isPromoCodeApplied;

  void applyPromoCode(String code) {
    if (code == "ADJ3AK") {
      _promoCode = code;
      _promoDiscount = subtotalPrice * 0.4; // 40% discount
      _isPromoCodeApplied = true;

      notifyListeners();
    } else {
      _promoCode = null;
      _promoDiscount = 0.0;
      _isPromoCodeApplied = false;

      notifyListeners();
    }
  }

  double get deliveryFee => 5.0;

  double get discount => subtotalPrice * 0.4;

  double get total => subtotalPrice - promoDiscount + deliveryFee;
}
