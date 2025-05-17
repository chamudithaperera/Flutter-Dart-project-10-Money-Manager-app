import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../auth/auth.dart';

// Reusable password field with eye icon
class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;

  const PasswordTextField({
    super.key,
    this.hintText = 'Password',
    this.controller,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGray,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.darkBlue.withOpacity(0.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          widget.hintText.toLowerCase().contains('confirm')
              ? Icons.lock_outline
              : Icons.lock,
          color: AppColors.darkBlue,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.darkBlue.withOpacity(0.7),
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Add text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGray,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkBlue.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Accent barizx
                    Container(
                      width: 50,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Title
                    Text(
                      'Money\nManager'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Roboto Mono',
                        color: AppColors.primaryOrange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Subtitle/tagline
                    Text(
                      'Create your account to start\nmanaging your finances.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.darkBlue.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Name TextField
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGray,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    const SizedBox(height: 20),

                    // Email TextField
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGray,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 20),

                    // Phone TextField
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGray,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 20),

                    // Password TextField with eye icon
                    PasswordTextField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),

                    const SizedBox(height: 20),

                    // Confirm Password TextField with eye icon
                    PasswordTextField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),

                    const SizedBox(height: 40),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _signup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          'SIGN UP',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Already have an account? Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: AppColors.darkBlue.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.primaryOrange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    // Validate passwords match
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    final success = await AuthService().createUserWithEmailAndPassword(
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );

    if (success) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to create account. Email may already be in use.',
          ),
        ),
      );
    }
  }
}
