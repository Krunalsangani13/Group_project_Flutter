import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ProductController.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.getProductsCont(); // Fetch products data.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.response.value.product == null ||
            productController.response.value.product!.isEmpty) {
          return const Center(child: Text('No products available'));
        }

        // Display the list of products.
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true, // Take only the needed height
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productController.response.value.product!.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productController.response.value.product![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.20,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              product.image ?? 'https://via.placeholder.com/150',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover, // Adjust image size and fit
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product.name ?? 'Unknown Name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Price: ₹${product.price}",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    width: Get.width * 0.5,
                                    child: Text(
                                      product.description ?? 'No Description',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text("Quantity: ${product.quantity}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
