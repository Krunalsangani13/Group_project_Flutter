import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/LoginController.dart';
import '../Screen/post_screen.dart';
import '../Screen/RegisterScreen.dart'; // Import your RegisterScreen here

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/LoginLogo.gif', // Update with your logo path
                //   height: 200,
                //   width: 200,
                // ),
                const SizedBox(height: 20),
                Text(
                  "Login Here",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                        controller: loginController.emailCTC,
                        hintText: "Enter your email",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      _buildPasswordField(
                        controller: loginController.passCTC,
                        hintText: "Enter your password",
                        isVisible: loginController.isPasswordVisible.value,
                        toggleVisibility: () {
                          setState(() {
                            loginController.togglePasswordVisibility();
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(() => loginController.isLoading.value
                          ? const CircularProgressIndicator()
                          : InkWell(
                        onTap: loginController.loginCont,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
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
                            "Register a new user",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostsScreen()),
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
                            "get data",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required VoidCallback toggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: toggleVisibility,
          ),
        ),
      ),
    );
  }
}
