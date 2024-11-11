import 'package:flutter/material.dart';
import '../Screen/GetTreeScreen.dart';
import '../Screen/ProductScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product details to be passed to ViewProductScreen
    final productName = "Sample Product";
    final productPrice = "\$100";
    final productDescription = "This is a sample product description.";
    final productImage = "/path/to/sample/image.jpg"; // Update with actual image path

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("E-CART"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo at the center
                Image.asset(
                  'assets/images/Welcome.png', // Ensure the logo path is correct
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 30),
                // Welcome text
                const Text(
                  "Welcome to E-CART",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text for contrast
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to AddProductScreen when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetTreeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Get Tree View",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Add Product Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to AddProductScreen when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black12,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "View Product",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
