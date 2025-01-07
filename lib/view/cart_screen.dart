
import 'package:ecommerce/notifier/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
    
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  final product = cartItem["product"];
                  final quantity = cartItem["quantity"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset(product.image, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 16),

                 
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.description,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline,
                                  color: Colors.green),
                              onPressed: () {
                                cartProvider.decrementQuantity(product.id);
                              },
                            ),
                            Text(
                              "$quantity",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline,
                                  color: Colors.green),
                              onPressed: () {
                                cartProvider.incrementQuantity(product.id);
                              },
                            ),
                          ],
                        ),

                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            cartProvider.removeFromCart(product.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPriceRow("Subtotal", cartProvider.subtotalPrice),
                const SizedBox(height: 8),
                _buildPriceRow("Delivery Fee", cartProvider.deliveryFee),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Discount',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '40%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

       
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              onPressed: () {
         
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$${cartProvider.total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          (amount >= 0 ? "\$" : "-\$") + amount.abs().toStringAsFixed(2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
