import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/notifier/cart_provider.dart';
import 'package:ecommerce/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Smartphones",
    "Headphones",
    "Laptops"
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Clearance\nSales",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: const Text(
                              "%  Up to  50%",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.phone_android,
                        size: 80, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("See all"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      productProvider.selectCategory(categories[index]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: productProvider.selectedCategory ==
                                categories[index]
                            ? Colors.green
                            : Colors.white,
                        border: Border.all(
                            color: productProvider.selectedCategory ==
                                    categories[index]
                                ? Colors.green
                                : Colors.black,
                            width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: productProvider.selectedCategory ==
                                  categories[index]
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: productProvider.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = productProvider.filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    product: product,
                                  )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(product.image),
                            )),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                const SizedBox(width: 4),
                                Text(product.rating),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.price.toString(),
                          style: const TextStyle(color: Colors.green),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
