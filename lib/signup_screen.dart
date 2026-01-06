import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF85B7D9),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // Gambar vektor di bawah
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/vector.png',
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),

            // Konten utama
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/images/tulisan DelzFood.png',
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField('Username', controller: _usernameController),
                    const SizedBox(height: 10),
                    _buildTextField('Email', controller: _emailController),
                    const SizedBox(height: 10),
                    _buildTextField('Password', isPassword: true, controller: _passwordController),
                    const SizedBox(height: 10),
                    _buildTextField('Confirm Password', isPassword: true, controller: _confirmPasswordController),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan validasi nanti
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3E4B6E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 1, indent: 30, endIndent: 10)),
                        Text("or sign in with", style: TextStyle(color: Colors.black54, fontSize: 12)),
                        Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 30)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo google.png', width: 40, height: 40),
                        const SizedBox(width: 20),
                        Image.asset('assets/images/logo X.png', width: 40, height: 40),
                        const SizedBox(width: 20),
                        Image.asset('assets/images/logo facebook.png', width: 50, height: 40),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 76, 219),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40), // cukup agar vector tidak ketutupan tapi tidak terlalu jauh
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint,
      {bool isPassword = false, required TextEditingController controller}) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}