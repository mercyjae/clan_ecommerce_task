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
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: Container(
          width: 20,
          margin: const EdgeInsets.only(top: 15, left: 10),
          padding: const EdgeInsets.only(left: 7),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, right: 10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, right: 10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  icon: const Icon(Icons.file_download_outlined,
                      color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
                height: sizeHeight * 0.35, child: Image.asset(product.image)),
          ),
          const SizedBox(height: 22),
          Container(
            height: MediaQuery.of(context).size.height * 0.47,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "%  On sale",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                              width: 70,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 18),
                                  SizedBox(width: 6),
                                  Text("4.8",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          const SizedBox(width: 16),
                          Container(
                              width: 70,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 3),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                          const SizedBox(width: 16),
                          const Text("117 reviews",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          StorageOption(
                            storage: "1 TB",
                            isSelected:
                                productProvider.selectedStorage == "1 TB",
                            onTap: () {
                              productProvider.selectStorage("1 TB");
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          StorageOption(
                            storage: "825 GB",
                            isSelected:
                                productProvider.selectedStorage == "825 GB",
                            onTap: () {
                              productProvider.selectStorage("825 GB");
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          StorageOption(
                            storage: "512 GB",
                            isSelected:
                                productProvider.selectedStorage == "512 GB",
                            onTap: () {
                              productProvider.selectStorage("512 GB");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${product.price.toString()}',
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '\$${product.price.toString()}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: sizeWidth * 0.6,
                        height: sizeWidth * 0.13,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(product);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()));
                          },
                          child: const Text(
                            "Add to Cart",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StorageOption extends StatelessWidget {
  final String storage;
  final bool isSelected;
  final VoidCallback onTap;

  const StorageOption({
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
