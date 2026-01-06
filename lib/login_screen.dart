import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart'; // Impor HomeScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String correctUsername = 'khayla';
  final String correctPassword = '12345';

  String? _loginMessage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF85B7D9),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/vector.png',
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
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
                    const SizedBox(height: 30),
                    _buildTextField('Username', controller: _usernameController),
                    const SizedBox(height: 16),
                    _buildTextField('Password', isPassword: true, controller: _passwordController),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text("Remember me"),
                          ],
                        ),
                        const Text(
                          "Forget your password?",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3E4B6E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Log in"),
                    ),
                    if (_loginMessage != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        _loginMessage!,
                        style: TextStyle(
                          color: _loginMessage == "Login berhasil" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                        const Text("Don't have account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 76, 219),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _handleLogin() {
    final enteredUsername = _usernameController.text.trim();
    final enteredPassword = _passwordController.text.trim();

    if (enteredUsername == correctUsername && enteredPassword == correctPassword) {
      setState(() {
        _loginMessage = "Login berhasil";
      });

      // Navigasi ke halaman HomeScreen setelah berhasil login
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      });
    } else {
      setState(() {
        _loginMessage = "Username atau password salah";
      });
    }
  }
}
