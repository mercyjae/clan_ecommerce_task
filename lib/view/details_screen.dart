import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/notifier/cart_provider.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final Products product;

  const DetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Center(
              child: Image.asset(product.image),
            ),
  
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "%  On sale",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

     
            Row(
              children: [
                Container(
                    width: 70,
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Icon(Icons.star, color: Colors.orange, size: 18),
                         SizedBox(width: 6),
                         Text("4.8",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )),
                const SizedBox(width: 16),
                Container(
                    width: 70,
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Icon(Icons.thumb_up,
                            color: Colors.green, size: 18),
                         SizedBox(width: 6),
                         Text("94%",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )),
                const SizedBox(width: 16),
                const Text("117 reviews", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),

            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            const SizedBox(height: 8),
            Row(
             
              children: [
                _StorageOption(
                  storage: "1 TB",
                  isSelected: productProvider.selectedStorage == "1 TB",
                  onTap: () {
                    productProvider.selectStorage("1 TB");
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                _StorageOption(
                  storage: "825 GB",
                  isSelected: productProvider.selectedStorage == "825 GB",
                  onTap: () {
                    productProvider.selectStorage("825 GB");
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                _StorageOption(
                  storage: "512 GB",
                  isSelected: productProvider.selectedStorage == "512 GB",
                  onTap: () {
                    productProvider.selectStorage("512 GB");
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.price.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      product.price.toString(),
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(product);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                
                  },
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StorageOption extends StatelessWidget {
  final String storage;
  final bool isSelected;
  final VoidCallback onTap;

  const _StorageOption({
    required this.storage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(
              color: isSelected ? Colors.green : Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          storage,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
