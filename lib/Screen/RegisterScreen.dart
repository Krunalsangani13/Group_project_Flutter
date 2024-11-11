import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/RegisterController.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController register = Get.put(RegisterController());
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register Page"),
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
                //   'assets/images/RegisterLogo.gif', // Update with your logo path
                //   height: 200,
                //   width: 300,
                // ),
                const SizedBox(height: 20),
                Text(
                  "Create a New Account",
                  style: TextStyle(
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
                        controller: register.nameCTC,
                        hintText: "Enter your name",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: register.sNameCTC,
                        hintText: "Enter your surname",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: register.emailCTC,
                        hintText: "Enter your email",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      _buildPasswordField(
                        controller: register.passCTC,
                        hintText: "Enter your password",
                        isVisible: _isPasswordVisible,
                        toggleVisibility: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(() => register.isLoading.value
                          ? CircularProgressIndicator()
                          : InkWell(
                        onTap: _onRegister,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have an account? Login here",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
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
        boxShadow: [
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
        boxShadow: [
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
          prefixIcon: Icon(Icons.lock),
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

  void _onRegister() {
    register.registerCont();
  }
}
